import SwiftUI
import SwiftData

/// Diary view allowing users to log their daily meals and exercise.
struct DiaryView: View {
    @Environment(\.modelContext) private var context // Access the model context for database operations
    @Query private var dailyEntries: [DailyEntry] // Fetch daily entries from the model
    @State private var selectedDate: Date = Date() // Track the selected date for logging entries
    @State private var breakfastCalories: String = "" // Store breakfast calories input
    @State private var lunchCalories: String = "" // Store lunch calories input
    @State private var dinnerCalories: String = "" // Store dinner calories input
    @State private var snackCalories: String = "" // Store snack calories input
    @State private var exerciseCalories: String = "" // Store exercise calories input
    @State private var showAlert = false // Control the visibility of the save entry alert
    @State private var showSavedEntries = false // Control the visibility of the saved entries view

    var body: some View {
        VStack {
            Text("TODAY")
                .font(.largeTitle)
                .padding()

            // Date Picker for selecting the date of the entry
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .padding()
                .onChange(of: selectedDate) { _ in
                    loadDailyEntry() // Load existing entry when the date changes
                }

            // Inputs for meals and exercise
            Form {
                Section(header: Text("Meals")) {
                    // Input fields for calories consumed in meals
                    TextField("Breakfast Calories", text: $breakfastCalories)
                        .keyboardType(.decimalPad)
                    TextField("Lunch Calories", text: $lunchCalories)
                        .keyboardType(.decimalPad)
                    TextField("Dinner Calories", text: $dinnerCalories)
                        .keyboardType(.decimalPad)
                    TextField("Snacks Calories", text: $snackCalories)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Exercise")) {
                    // Input field for calories burned through exercise
                    TextField("Exercise Calories", text: $exerciseCalories)
                        .keyboardType(.decimalPad)
                }

                // Button to save daily entry
                Button("Save Entry") {
                    saveDailyEntry() // Call function to save the entry
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Entry Saved"), message: Text("Your daily entry has been saved."), dismissButton: .default(Text("OK")))
                }
                
                // Button to show saved entries
                Button("View Saved Entries") {
                    showSavedEntries = true // Show the saved entries view
                }
            }
        }
        .onAppear {
            loadDailyEntry() // Load existing entry for the selected date when the view appears
        }
        .fullScreenCover(isPresented: $showSavedEntries) {
            SavedEntriesView() // Present the view showing saved entries
        }
    }

    /// Saves the daily entry to the model context.
    private func saveDailyEntry() {
        let entry = DailyEntry(
            date: selectedDate, // Set the date for the entry
            breakfastCalories: Double(breakfastCalories) ?? 0, // Convert input to Double or default to 0
            lunchCalories: Double(lunchCalories) ?? 0,
            dinnerCalories: Double(dinnerCalories) ?? 0,
            snackCalories: Double(snackCalories) ?? 0,
            exerciseCalories: Double(exerciseCalories) ?? 0
        )

        context.insert(entry) // Insert the new entry into the context

        do {
            try context.save() // Attempt to save the entry
            showAlert = true // Show success alert
        } catch {
            print("Error saving daily entry: \(error)") // Print error if save fails
        }
    }

    /// Loads the daily entry for the selected date.
    private func loadDailyEntry() {
        // Check if there is an existing entry for the selected date
        if let existingEntry = dailyEntries.first(where: { $0.date == selectedDate }) {
            // Populate input fields with existing entry data
            breakfastCalories = String(existingEntry.breakfastCalories)
            lunchCalories = String(existingEntry.lunchCalories)
            dinnerCalories = String(existingEntry.dinnerCalories)
            snackCalories = String(existingEntry.snackCalories)
            exerciseCalories = String(existingEntry.exerciseCalories)
        } else {
            // Clear fields if no entry exists for the selected date
            breakfastCalories = ""
            lunchCalories = ""
            dinnerCalories = ""
            snackCalories = ""
            exerciseCalories = ""
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
