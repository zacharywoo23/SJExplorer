//
//  ContentView.swift
//  137-SJExplorer
//
//  The main view

import SwiftUI
import SwiftData


struct SJExplorer: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject var authManager = AuthManager()
    

    var body: some View {
        NavigationView {
            VStack {
                Text("SJExplorer")
                //Default main view (show up when logged in)
                if authManager.isLoggedIn {
                    Spacer()
                        .frame(height:40)
                    Button("Sign Out"){
                        authManager.signOut()
                    }
                    .foregroundStyle(.black)
                }
                else if authManager.isUsingBioLogin {
                    //take user to biometric view
                    BiometricView(authManager: (authManager)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
                } else if authManager.isRegistering {
                    RegisterView(authManager: authManager)
                    
                } else {
                    //Signed out users see login screen
                    LoginView(authManager: authManager)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
        }
        .navigationViewStyle(.stack)
        
    }
    
    
}
    
    

#Preview {
    SJExplorer()
        .modelContainer(for: Item.self, inMemory: true)
}
