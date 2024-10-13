//
//  StatsView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI
import SwiftData

/// Stats view displaying user’s total daily calories and macronutrient breakdown.
struct StatsView: View {
    @Environment(\.modelContext) private var context
    @Query private var userProfiles: [UserProfile] // Query to fetch user profile data

    var body: some View {
        // Check if a user profile exists
        if let profile = userProfiles.first { // Assuming there's only one profile
            VStack(spacing: 20) { // Vertical stack for arranging elements with spacing
                Text("Based on the information you provided...") // Introduction text
                    .font(.headline)
                    .padding() // Add padding for better layout

                // Display total daily calories rounded to the nearest integer
                Text("Your Total Daily Calories should be: \(Int(profile.totalCalories))")
                    .font(.title)
                    .padding(.vertical) // Vertical padding for spacing

                Text("Your daily macros should be:") // Heading for macro information
                    .font(.headline)

                // Vertical stack for displaying macros with spacing
                VStack(spacing: 10) {
                    // Display protein intake rounded to the nearest integer
                    Text("Protein: \(Int(profile.protein)) g")
                    // Display fat intake rounded to the nearest integer
                    Text("Fats: \(Int(profile.fat)) g")
                    // Display carbohydrate intake rounded to the nearest integer
                    Text("Carbohydrates: \(Int(profile.carbohydrates)) g")
                }
                .padding(.vertical) // Add vertical padding for spacing

                Spacer() // Push content to the top of the view
            }
            .padding() // Add padding around the VStack
            .background(Color(UIColor.systemGroupedBackground)) // Background color for contrast
            .cornerRadius(10) // Round corners for aesthetic appeal
            .shadow(radius: 5) // Add shadow for depth
        } else {
            // Message displayed if no user profile is found
            Text("No user profile found.")
                .foregroundColor(.red) // Change color to red for visibility
        }
    }
}
