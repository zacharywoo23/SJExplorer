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
    
}
    
    

#Preview {
    SJExplorer()
        .modelContainer(for: Item.self, inMemory: true)
}
