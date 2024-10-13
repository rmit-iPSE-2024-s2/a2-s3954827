import SwiftUI
import SwiftData

/// Main content view that manages tabbed navigation and user profile.
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext // Access to the model context for data operations
    @Query private var userProfiles: [UserProfile] // Query for UserProfile
    @State private var selectedTab = 0 // Track the currently selected tab
    @State private var isPresentingSetupView = false // State variable for presenting SetupView

    var body: some View {
        VStack {
            Spacer() // Pushes the Tab Bar to the bottom

            // Main content based on the selected tab
            switch selectedTab {
            case 0:
                DashboardView() // Displays the Dashboard view
            case 1:
                DiaryView() // Displays the Diary view
            case 2:
                ProgressScreenView() // Displays the Progress view
            case 3:
                WorkoutsView() // Displays the Workouts view
            default:
                MoreView() // Displays the More view
            }

            // Custom Tab Bar
            HStack {
                TabBarButton(imageName: "rectangle.grid.2x2.fill", text: "Dashboard", isSelected: selectedTab == 0) {
                    selectedTab = 0 // Change tab to Dashboard
                }
                Spacer()
                TabBarButton(imageName: "book.fill", text: "Diary", isSelected: selectedTab == 1) {
                    selectedTab = 1 // Change tab to Diary
                }
                Spacer()
                TabBarButton(imageName: "chart.line.uptrend.xyaxis", text: "Progress", isSelected: selectedTab == 2) {
                    selectedTab = 2 // Change tab to Progress
                }
                Spacer()
                TabBarButton(imageName: "dumbbell.fill", text: "Workouts", isSelected: selectedTab == 3) {
                    selectedTab = 3 // Change tab to Workouts
                }
                Spacer()
                TabBarButton(imageName: "ellipsis", text: "More", isSelected: selectedTab == 4) {
                    selectedTab = 4 // Change tab to More
                }
            }
            .padding(.horizontal, 10) // Horizontal padding for the tab bar
            .padding(.vertical, 5) // Vertical padding for the tab bar
            .background(Color.gray.opacity(0.5)) // Background color for the tab bar
            .cornerRadius(15) // Rounded corners for the tab bar
            .padding(.bottom, -34) // Negative bottom padding to overlap with content
        }
        .sheet(isPresented: $isPresentingSetupView) {
            SetupView() // Present SetupView to gather user profile info
        }
        .onAppear {
            // Log the loaded profiles to the console for debugging
            print("Loaded User Profiles: \(userProfiles)")

            // If there are no profiles, show the SetupView
            if userProfiles.isEmpty {
                isPresentingSetupView = true // Trigger presentation of SetupView
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: UserProfile.self, inMemory: true) // Preview setup with in-memory model container
}
