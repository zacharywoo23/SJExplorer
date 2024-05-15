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
    @ObservedObject var locationManager = LocationManager.shared
    
@ObservedObject var networkManager = NetworkMonitor()
    
    

    var body: some View {
        if networkManager.isConnected {
            NavigationView {
                ZStack {
                    //Gradient background
                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    VStack {
                        
                        
                        //Default main view (show up when logged in)
                        
                        //Get the user if one already logged in when starting up
                        
                        
                        let user = try? authManager.getUser()
                        
                        if authManager.isLoggedIn {

                            HomeTabs()
           
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
                
            }
            .navigationViewStyle(.stack)
            
        } else {
            NoWifi()
        }
        
        
    }
}
    
    

#Preview {
    SJExplorer()
        .modelContainer(for: Item.self, inMemory: true)
}
