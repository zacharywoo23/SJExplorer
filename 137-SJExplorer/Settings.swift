//
//  Settings.swift
//  137-SJExplorer
//
//  Created by Dennis Shih

//The settings page view.
//

import SwiftUI
import UserNotifications

struct Settings: View {
    @StateObject var authManager = AuthManager()
    @State private var connectivity = false
    @State private var showingAlert = false
    @State private var notifyPermission = false
    
    

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
                
            VStack {
                Image(.logo).resizable().frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 400, height: 350)
                    .padding(10)
                    .foregroundColor(Color(hex: 0x7C91aa))
                Spacer()
                    .frame(height:80)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 100)
                    .padding(10)
                    .foregroundColor(Color(hex: 0x7C91aa))
            }
            VStack {
                Spacer()
                    .frame(height:100)
                Text("Settings")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                
                Spacer()
                    .frame(height:50)
                
                
                NavigationLink {
                    SetNotificationView()
                } label: {
                    Label("Set Notification", systemImage: "bell")
                }

                /*
                Button("Set"){
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,.sound]) {
                        success, error in
                        if success {
                            notifyPermission=true
                            print("all set")
                        } else if let error {
                            print(error.localizedDescription)
                            return
                        }
                    }
                    let content = UNMutableNotificationContent()
                    
                    var dateComponents = DateComponents()
                    dateComponents.calendar = Calendar.current

                    //
                    dateComponents.weekday = 3
                    dateComponents.hour = 14
                    content.title = "test"
                    content.subtitle = "test"
                    content.sound = UNNotificationSound.default
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }
                 */
                
                
                .foregroundStyle(.black)
                .padding(10)
                .background(
                    Capsule()
                        .fill(Color.blue)
                )
                Spacer()
                    .frame(height:30)
                Button("Sign Out"){
                    authManager.signOut()
                    
                }
                
                .foregroundStyle(.black)
                .padding(10)
                .background(
                    Capsule()
                        .fill(Color.blue)
                )
                Spacer()
                    .frame(height:200)
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
