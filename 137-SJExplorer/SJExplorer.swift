//
//  ContentView.swift
//  137-SJExplorer
//
//

import SwiftUI
import SwiftData


struct SJExplorer: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationView {
            VStack {
                Text("SJExplorer")
                //temporary for navigation, not final design
                Spacer()
                    .frame(height:40)
                NavigationLink(destination: RegisterView()) {
                    Text("Sign Up")
                }
                .foregroundStyle(.black)
            }
        }
    }
    
}
    
    

#Preview {
    SJExplorer()
        .modelContainer(for: Item.self, inMemory: true)
}
