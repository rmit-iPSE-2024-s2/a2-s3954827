//
//  SetupView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI
import SwiftData

/// Setup view for gathering user information and calculating macros.
struct SetupView: View {
    @Environment(\.modelContext) private var context
    @State private var weight: Double? // User's weight in kg
    @State private var height: Double? // User's height in cm
    @State private var age: Int? // User's age
    @State private var gender: String = "Male" // Default gender selection
    @State private var activityLevel: String = "Sedentary" // Default activity level
    @State private var goal: String = "Maintenance" // Default fitness goal
    @State private var showAlert = false // Alert to indicate success of saving preferences

    var body: some View {
        Form {
            // Section for user information input
            Section(header: Text("User Information")) {
                TextField("Weight (kg)", value: $weight, formatter: NumberFormatter())
                    .keyboardType(.decimalPad) // Numeric input for weight
                TextField("Height (cm)", value: $height, formatter: NumberFormatter())
                    .keyboardType(.decimalPad) // Numeric input for height
                TextField("Age", value: $age, formatter: NumberFormatter())
                    .keyboardType(.numberPad) // Numeric input for age

                // Picker for gender selection
                Picker("Gender", selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }

                // Picker for activity level selection
                Picker("Activity Level", selection: $activityLevel) {
                    Text("Sedentary").tag("Sedentary")
                    Text("Lightly active").tag("Lightly")
                    Text("Moderately active").tag("Moderately")
                    Text("Very active").tag("Very")
                    Text("Super active").tag("Super")
                }

                // Picker for fitness goal selection
                Picker("Goal", selection: $goal) {
                    Text("Weight Loss").tag("Weight loss")
                    Text("Muscle Gain").tag("Muscle gain")
                    Text("Maintenance").tag("Maintenance")
                }
            }

            // Button to save user preferences
            Button("Save Preferences") {
                saveUserProfile() // Call to save user profile
            }
            .alert(isPresented: $showAlert) {
                // Alert for successful saving of preferences
                Alert(title: Text("Preferences Saved"), message: Text("Your preferences have been saved successfully."), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func saveUserProfile() {
        // Calculate macros using the user's input data
        let macros = calculateMacros(weight: weight ?? 0, height: height ?? 0, age: age ?? 0, gender: gender, activityLevel: activityLevel, goal: goal)

        // Create a UserProfile instance with the provided data
        let userProfile = UserProfile(
            weight: weight ?? 0,
            height: height ?? 0,
            age: age ?? 0,
            gender: gender,
            activityLevel: activityLevel,
            goal: goal,
            totalCalories: macros.totalCalories, // Total calories calculated
            protein: macros.protein, // Protein intake calculated
            fat: macros.fat, // Fat intake calculated
            carbohydrates: macros.carbohydrates // Carbohydrates intake calculated
        )

        context.insert(userProfile) // Insert the user profile into the context

        do {
            try context.save() // Attempt to save the user profile
            showAlert = true // Show success alert
            // Log the saved data
            print("User Profile Saved: \(userProfile)")
        } catch {
            print("Error saving user profile: \(error)") // Log any error that occurs
        }
    }

    private func calculateMacros(weight: Double, height: Double, age: Int, gender: String, activityLevel: String, goal: String) -> (totalCalories: Double, protein: Double, fat: Double, carbohydrates: Double) {
        var bmr: Double = 0.0 // Basal metabolic rate calculation

        // Calculate BMR based on gender
        if gender == "Male" {
            bmr = 10 * weight + 6.25 * height - 5 * Double(age) + 5
        } else {
            bmr = 10 * weight + 6.25 * height - 5 * Double(age) - 161
        }

        // Calculate total daily energy expenditure (TDEE) based on activity level
        var tdee: Double = 0.0
        switch activityLevel {
        case "Sedentary":
            tdee = bmr * 1.2
        case "Lightly":
            tdee = bmr * 1.375
        case "Moderately":
            tdee = bmr * 1.55
        case "Very":
            tdee = bmr * 1.725
        case "Super":
            tdee = bmr * 1.9
        default:
            tdee = bmr // Default to BMR if no activity level matches
        }

        var targetCalories = tdee // Initialize target calories
        switch goal {
        case "Weight loss":
            targetCalories -= targetCalories * 0.10 // Decrease for weight loss
        case "Muscle gain":
            targetCalories += targetCalories * 0.10 // Increase for muscle gain
        case "Maintenance":
            break // No change for maintenance
        default:
            targetCalories = tdee // Default to TDEE if no goal matches
        }

        // Calculate macronutrient breakdown
        let protein = weight * 2.2 // Convert weight from kg to lbs for protein calculation
        let proteinCalories = protein * 4 // Protein has 4 calories per gram
        let fatCalories = targetCalories * 0.25 // Assuming 25% of total calories from fat
        let fat = fatCalories / 9 // Fat has 9 calories per gram
        let carbohydrateCalories = targetCalories - (proteinCalories + fatCalories) // Remaining calories for carbs
        let carbohydrates = carbohydrateCalories / 4 // Carbs have 4 calories per gram
        
        return (totalCalories: targetCalories, protein: protein, fat: fat, carbohydrates: carbohydrates) // Return calculated macronutrients
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView() // Preview for SetupView
    }
}
