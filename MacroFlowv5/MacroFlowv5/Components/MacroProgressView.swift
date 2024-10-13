//
//  MacroProgressView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Custom circular progress view to display macro tracking (Carbs, Fats, Protein).
struct MacroProgressView: View {
    var label: String // Label for the macro (e.g., Carbs, Fats, Protein)
    var progress: Double // Progress value (0.0 to 1.0)
    var color: Color // Color to represent the macro

    var body: some View {
        VStack {
            Text(label)
                .font(.caption)
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .opacity(0.3)
                    .foregroundColor(color)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.linear)
                
                Text(String(format: "%.0f %%", min(progress, 1.0) * 100.0))
                    .font(.caption)
                    .bold()
            }
            .frame(width: 60, height: 60)
        }
    }
}
