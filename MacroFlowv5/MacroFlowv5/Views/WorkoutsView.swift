//
//  WorkoutsView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Workouts view displaying different workout categories with background images.
struct WorkoutsView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title of the workouts view
            Text("Workouts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, -15)
            
            // Push Workout Section
            Button(action: {
                // Action for Push workout
            }) {
                ZStack {
                    Image("pushImage") // Background image for Push workout
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(15)

                    Text("PUSH") // Title for Push workout
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
            }
            .buttonStyle(PlainButtonStyle()) // Custom button style

            // Pull Workout Section
            Button(action: {
                // Action for Pull workout
            }) {
                ZStack {
                    Image("pullImage") // Background image for Pull workout
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(15)

                    Text("PULL") // Title for Pull workout
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
            }
            .buttonStyle(PlainButtonStyle()) // Custom button style

            // Legs Workout Section
            Button(action: {
                // Action for Legs workout
            }) {
                ZStack {
                    Image("legsImage") // Background image for Legs workout
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(15)

                    Text("LEGS") // Title for Legs workout
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
            }
            .buttonStyle(PlainButtonStyle()) // Custom button style

            Spacer() // Space to push content up
        }
        .padding() // Overall padding for the view
    }
}
