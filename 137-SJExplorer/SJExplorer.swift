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
            ZStack {
                //Gradient background
                LinearGradient(gradient: Gradient(colors: [.yellow, Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    
                    
                     //Default main view (show up when logged in)
                    
                    
                    let user = try? authManager.getUser()
                    
                    if authManager.isLoggedIn {
                        if user != nil {
                            let username=user?.email
                            Text("Signed in as \(username!)")
                            Image(.logo).resizable().frame(width: 200, height: 200)
                        }
                         Spacer()
                             .frame(height:40)
                         Text("Welcome to SJExplorer")
                         Spacer()
                             .frame(height:40)
                         Button("Start Playing") {
                             
                         }
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
                    
                     
                    //Preview for logged in screen - leave commented when not testing
                    /*
                    var username=NSUserName()
                    Text("Logged in as \(username)")
                    Image(.logo).resizable().frame(width: 200, height: 200)
                    Spacer()
                        .frame(height:40)
                    Text("Welcome to SJExplorer")
                    Spacer()
                        .frame(height:40)
                    Button("Start Playing") {
                        
                    }
                    Spacer()
                        .frame(height:40)
                     Button("Sign Out"){
                         authManager.signOut()
                     }
                     .foregroundStyle(.black)
                     
                     
                     */
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
