//
//  DiaryDetailView.swift
//  MacroFlowv5
//
//  Created by Ryan D'Mello on 13/10/2024.
//

import SwiftUI

/// View for displaying detailed information of a daily entry.
struct DiaryDetailView: View {
    let entry: DailyEntry // The daily entry to be displayed

    var body: some View {
        VStack {
            // Display the date of the entry, formatted as a string
            Text("Entry for \(entry.date, formatter: DateFormatter())")
                .font(.title)
                .padding()

            // Display the calorie counts for each meal and exercise
            Text("Breakfast Calories: \(entry.breakfastCalories)")
            Text("Lunch Calories: \(entry.lunchCalories)")
            Text("Dinner Calories: \(entry.dinnerCalories)")
            Text("Snack Calories: \(entry.snackCalories)")
            Text("Exercise Calories: \(entry.exerciseCalories)")
        }
        .padding() // Add padding around the VStack
    }
}
