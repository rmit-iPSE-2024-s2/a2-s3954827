//
//  MoreView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// More view displaying additional settings and options for the user.
struct MoreView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title of the More view
                Text("More")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, -15)

                // Content Sections for additional options
                VStack(spacing: 20) {
                    // Set Up Option leading to SetupView
                    NavigationLink(destination: SetupView()) {
                        HStack {
                            Image(systemName: "plus.circle") // Icon for Set Up
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("Set Up") // Title for Set Up
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right") // Indicator for navigation
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1)) // Background styling
                        .cornerRadius(10)
                    }
                    
                    // My Stats Option leading to StatsView
                    NavigationLink(destination: StatsView()) {
                        HStack {
                            Image(systemName: "info.circle") // Icon for My Stats
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("My Stats") // Title for My Stats
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right") // Indicator for navigation
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1)) // Background styling
                        .cornerRadius(10)
                    }

                    // My Profile Option
                    Button(action: {
                        // Action for My Profile
                    }) {
                        HStack {
                            Image(systemName: "person.crop.circle") // Icon for My Profile
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("My Profile") // Title for My Profile
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right") // Indicator for navigation
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1)) // Background styling
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20) // Horizontal padding for content sections

                Spacer() // Space to push content up
            }
            .padding() // Overall padding for the view
            .navigationTitle("More Options") // Set the navigation title
            .navigationBarTitleDisplayMode(.inline) // Inline title display
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView() // Preview for MoreView
    }
}
