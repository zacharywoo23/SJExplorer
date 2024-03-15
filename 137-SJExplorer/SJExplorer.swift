//
//  ContentView.swift
//  137-SJExplorer
//
//  Created by Leslie Ortiz on 3/15/24.
//

import SwiftUI
import SwiftData

struct SJExplorer: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Text("SJExplorer")
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    SJExplorer()
        .modelContainer(for: Item.self, inMemory: true)
}
