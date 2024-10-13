//
//  SwiftUIView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

// NOTE: This view uses a custom layout. I chose to do a custom layout for this view,
// as it was the most complicated view for the prototype, with a graph on the screen.
// With this, I came to a conclusion that it could benefit the most from a custom layout.
// All other work has been using SwiftUI layouts as specified in the assessment.

import SwiftUI

/// Progress view displaying weight change over time with a graph and list of entries.
struct ProgressScreenView: View {
    @State private var selectedRange = "Weight" // State variable for selecting the type of data to display

    var body: some View {
        VStack(spacing: 20) {
            // Title of the view
            Text("Progress")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, -15)

            // Navigation controls allowing user to navigate back or add a new entry
            HStack {
                Button(action: {
                    // Action to go to the previous screen (placeholder)
                }) {
                    Image(systemName: "chevron.left") // Back button icon
                        .foregroundColor(.blue)
                }

                Spacer() // Creates space between buttons

                Button(action: {
                    // Action to add new data (placeholder)
                }) {
                    Image(systemName: "plus") // Plus icon for adding a new entry
                        .foregroundColor(.blue)
                    Text("New Entry") // Text for the button
                        .font(.body)
                        .fontWeight(.light)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            // Weight data display showing current and starting weight
            HStack(spacing: 20) { // Adjust spacing as needed
                VStack {
                    Text("55.4 kg") // Starting weight
                        .font(.headline)
                    Text("START") // Label for starting weight
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                VStack {
                    Text("56.9 kg") // Current weight
                        .font(.headline)
                    Text("CURRENT") // Label for current weight
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                VStack {
                    Text("+1.5 kg") // Change in weight
                        .font(.headline)
                    Text("CHANGE (+2.7%)") // Change percentage
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding() // Padding for weight data display
            .background(Color.gray.opacity(0.1)) // Light grey background for the section
            .cornerRadius(15) // Rounded corners for the background
            .padding(.horizontal, 20) // Horizontal padding for the entire section

            // Graph component displaying weight progress
            ProgressGraphView()
                .frame(height: 200) // Set height for the graph
                .padding(.horizontal, 20) // Padding for the graph

            // Entries list displaying historical weight entries
            VStack(alignment: .leading, spacing: 15) {
                Text("Entries") // Header for the entries section
                    .font(.headline)
                    .padding(.leading, 20) // Left padding for the header

                // Loop through sample entries to display each entry
                ForEach(sampleEntries, id: \.self) { entry in
                    HStack {
                        Text(entry) // Display the entry text
                            .font(.body)
                            .lineLimit(1) // Limit to one line for display
                            .frame(maxWidth: .infinity, alignment: .leading) // Align to the left
                        Spacer() // Space between entry text and edit button
                        Button(action: {
                            // Action to view/edit entry (placeholder)
                        }) {
                            Image(systemName: "square.and.pencil") // Edit icon for the entry
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 20) // Padding for each entry row
                }
            }
            .padding(.vertical, 10) // Vertical padding for the entries section

            Spacer() // Space to push content to the top
        }
        .padding() // Overall padding for the view
    }
}

// Sample Data for Entries List
let sampleEntries = [
    "56.9 kg    Friday 15 October 2021",
    "55.8 kg    Wednesday 13 October 2021",
    "58.4 kg    Tuesday 11 February 2020",
    "58.8 kg    Wednesday 11 December 2019"
]
