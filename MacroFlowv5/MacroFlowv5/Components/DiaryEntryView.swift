//
//  DiaryEntryView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Custom view component for each diary entry section, such as meals and exercise.
struct DiaryEntryView: View {
    var meal: String // The name of the meal (e.g., Breakfast, Lunch)
    var actionText: String // Text for the action button (e.g., ADD FOOD +)

    var body: some View {
        HStack {
            Text(meal)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                // Action to add food or exercise
            }) {
                Text(actionText)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

