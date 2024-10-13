//
//  File.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Custom graph view to display progress data visually.
struct ProgressGraphView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            // Data points for the graph
            let dataPoints: [CGFloat] = [0.2, 0.6, 0.5, 0.8, 0.3, 0.7, 0.4]
            let maxWeight: CGFloat = 60  // Example max weight for Y-axis scale
            let minWeight: CGFloat = 55  // Example min weight for Y-axis scale

            ZStack {
                // Graph Line
                Path { path in
                    path.move(to: CGPoint(x: 0, y: height * (1 - dataPoints[0])))

                    for (index, dataPoint) in dataPoints.enumerated() {
                        let x = width * CGFloat(index) / CGFloat(dataPoints.count - 1)
                        let y = height * (1 - dataPoint)
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
                
                // Y-Axis Labels (overlay on the left)
                VStack {
                    Text("\(maxWeight, specifier: "%.1f") kg")
                        .font(.caption)
                        .padding(.top, 5)
                        .frame(width: 50, alignment: .trailing)
                    Spacer()
                    Text("\(minWeight, specifier: "%.1f") kg")
                        .font(.caption)
                        .padding(.bottom, 5)
                        .frame(width: 50, alignment: .trailing)
                }
                .offset(x: -40) // Move labels outside the graph area
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.leading, 20)

                // X-Axis Labels (overlay on the bottom)
                HStack {
                    ForEach(0..<dataPoints.count) { index in
                        Text("01/0\(index + 1)")
                            .font(.caption2)
                            .frame(maxWidth: .infinity)
                    }
                }
                .offset(y: 20) // Move labels below the graph line
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 10)
            }
        }
        .padding([.leading, .bottom], 20) // Padding for the entire graph view
    }
}

