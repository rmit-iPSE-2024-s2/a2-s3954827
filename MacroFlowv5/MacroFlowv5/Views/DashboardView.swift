//
//  DashboardView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Dashboard view displaying macro and calorie tracking information.
struct DashboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            // App title
            Text("MacroFlow")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, -25)

            // Subtitle aligned to the left
            HStack {
                Text("How you’re tracking today")
                    .font(.headline)
                    .padding(.leading, 20)
                    .padding(.top, 20)
                Spacer()
            }
            
            // Macros Section
            VStack(spacing: 30) {
                Text("Macros")
                    .font(.title2)
                    .padding(.top, 30)
        
                HStack(spacing: 30) {
                    MacroProgressView(label: "Carbs", progress: 0.7, color: .green)
                    MacroProgressView(label: "Fats", progress: 0.5, color: .blue)
                    MacroProgressView(label: "Protein", progress: 0.8, color: .red)
                }
                .padding(40)
                .background(Color.green.opacity(0.2))
                .cornerRadius(15)
            }
            .padding(.horizontal, 20)

            // Calories Section with background covering all related content
            VStack(alignment: .leading, spacing: 15) {
                Text("Calories")
                    .font(.title2)
                    .padding(.leading, 20)
                    .padding(.top, 15)
                
                ProgressView(value: 0.35)
                    .progressViewStyle(LinearProgressViewStyle(tint: .black))
                    .frame(height: 20)
                    .padding(.horizontal)
                    .cornerRadius(10)
                
                HStack {
                    Text("1300 cal")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text("35% towards goal")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 15)
            }
            .background(Color.orange.opacity(0.2))
            .cornerRadius(15)
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
    }
}
