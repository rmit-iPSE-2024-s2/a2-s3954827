//
//  SavedEntriesView.swift
//  MacroFlow Prototype
//
//  Created by Ryan D'Mello on 1/9/2024.
//

import SwiftUI
import SwiftData

/// View for displaying a list of saved daily entries.
struct SavedEntriesView: View {
    @Environment(\.modelContext) private var context
    @Query private var dailyEntries: [DailyEntry] // Fetch saved daily entries
    @Environment(\.dismiss) private var dismiss // Environment variable to dismiss the view

    var body: some View {
        NavigationView {
            List {
                // For each daily entry, create a navigation link to the detail view
                ForEach(dailyEntries) { entry in
                    NavigationLink(destination: DiaryDetailView(entry: entry)) {
                        // Display the date of the entry formatted as a string
                        Text("\(entry.date, formatter: DateFormatter())")
                    }
                }
                .onDelete(perform: deleteEntries) // Enable swipe-to-delete functionality
            }
            .navigationTitle("Saved Entries") // Set the navigation title
            .navigationBarItems(trailing: Button("Done") {
                dismiss() // Dismiss the SavedEntriesView when Done is tapped
            })
        }
    }

    private func deleteEntries(offsets: IndexSet) {
        withAnimation {
            // Delete entries based on the provided offsets
            offsets.map { dailyEntries[$0] }.forEach(context.delete)
        }
    }
}

struct SavedEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview for SavedEntriesView with a sample DailyEntry model
        SavedEntriesView()
            .modelContainer(for: DailyEntry.self, inMemory: true)
    }
}
