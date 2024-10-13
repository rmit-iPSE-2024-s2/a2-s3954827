//
//  TabBarButton.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI

/// Custom button component for the tab bar with an icon and text.
struct TabBarButton: View {
    var imageName: String // Icon name for the button
    var text: String // Text label for the button
    var isSelected: Bool // State to indicate if the tab is selected
    var action: () -> Void // Action to perform when the button is pressed

    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {  // Adjusts spacing between icon and text
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .frame(width: 40, height: 24) // Sets a uniform size for all icons
                    .foregroundColor(isSelected ? .blue : .black) // Changes color based on selection
                Text(text)
                    .font(.caption)
                    .frame(height: 20) // Ensures consistent height for text labels
                    .foregroundColor(isSelected ? .blue : .black)
            }
            .frame(maxWidth: .infinity, maxHeight: 60) // Ensures consistent button size
        }
        .padding(.vertical, 10)
    }
}
