//
//  Settings.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/7/24.
//

import SwiftUI
import UserNotifications

struct Settings: View {
    @StateObject var authManager = AuthManager()
    @State private var connectivity = false
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 400, height: 400)
                .padding(10)
                
                .foregroundColor(Color(hex: 0x7C9CD4))
            VStack {
                Text("Settings")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Button("DELETE ACCOUNT"){
                    showingAlert = true
                }
                .bold()
                .foregroundStyle(.black)
                .padding(10)
                .background(
                    Capsule()
                        .fill(Color.red)
                )
                Toggle(isOn: self.$connectivity) {
                    Label("Internet connection", systemImage: "wifi")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(width:200, height:50)
                
                
                Spacer()
                    .frame(height:50)
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
            .padding()
            .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Warning"), message: Text("Are you sure you want to delete your account? This action cannot be undone."), primaryButton: .destructive(Text("Delete"), action: {
                                
                                authManager.deleteAccount()
                            }), secondaryButton: .cancel())
                        }
        }
    }
}

#Preview {
    Settings()
}
