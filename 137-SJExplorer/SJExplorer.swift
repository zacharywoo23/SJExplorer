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
    
    var viewWidth = ViewAttributes.shared.viewWidth
    var viewHeight = ViewAttributes.shared.viewHeight

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
                        
                        if user != nil {
                            
                            if !authManager.isBioAuthenticated {
                                BiometricView(authManager: authManager)
                            } else {
                                
                                
                                if user?.email != nil {
                                    let username=user?.email
                                    Text("Signed in as \(username!)")
                                }
                                Text("Welcome, Spartan")
                                Image(.logo).resizable().frame(width: 200, height: 200)
                                Spacer()
                                    .frame(height:40)
                                Text("Welcome to SJExplorer")
                                Spacer()
                                    .frame(height:40)
                                
                                //Not yet sure whether to use NavLink or set state for this
                                
                                /*Button("Start Playing") {
                                 
                                 }
                                 */
                                
                                NavigationLink(destination: HomeTabs()) {
                                    Text("Start playing")
                                }
                                .frame(width: viewWidth)
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(
                                    Capsule()
                                        .fill(Color.blue))
                                
                                NavigationLink(destination: ScoreView()) {
                                    Text("Score")
                                }
                                .frame(width: viewWidth)
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(
                                    Capsule()
                                        .fill(Color.blue))
                                
                                
                                NavigationLink(destination: HomeTabs()) {
                                    Text("Friends")
                                }
                                .frame(width: viewWidth)
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(
                                    Capsule()
                                        .fill(Color.blue))
                                
                                NavigationLink(destination: Settings()) {
                                    Text(" Settings")
                                }
                                .frame(width: viewWidth)
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(
                                    Capsule()
                                        .fill(Color.blue))
                                
                                
                                
                            
                                Spacer()
                                    .frame(height:40)
                                Button("Sign Out"){
                                    authManager.signOut()
                                }
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(
                                    Capsule()
                                        .fill(Color.blue)
                                )
                            }
                            
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
                         
                         
                         Text("Welcome, Spartan")
                         Image(.logo).resizable().frame(width: 200, height: 200)
                         Spacer()
                         .frame(height:40)
                         Text("Welcome to SJExplorer")
                         Spacer()
                         .frame(height:40)
                         
                         //Not yet sure whether to use NavLink or set state for this
                         
                         /*Button("Start Playing") {
                          
                          }
                          */
                         
                         
                         NavigationLink(destination: SwiftUIView()) {
                         Text("zz")
                         }
                         Spacer()
                         .frame(height:40)
                         Button("Sign Out"){
                         authManager.signOut()
                         }
                         .foregroundStyle(.black)
                         .padding(10)
                         .background(
                         Capsule()
                         .fill(Color.blue)
                         )
                         
                         */
                        
                        
                        
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
