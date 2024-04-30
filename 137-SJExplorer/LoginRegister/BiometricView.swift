//
//  SwiftUIView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 3/26/24.
//

import SwiftUI
import LocalAuthentication
import FirebaseAuth


struct BiometricView: View {
    @State private var unlocked = false
    @State private var text = "Please scan your face"
    @ObservedObject var authManager : AuthManager
    
    var body: some View {
        
        
        //Biometric view
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7c9cd4), .yellow]), startPoint: .center, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                    Image("face")
                        .resizable()
                        .frame(width: 350, height: 350)
                    Spacer()
                        .frame(height: 50)
                    Text(text)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Button("Authenticate") {
                        authenticate()
                    }
                
                
                
            }
        }
    }
    
    func authenticate() {
        let context=LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "security") { success, authenticationError in
                
                if success {
                    text="Unlocked"
                    unlocked=true
                    Auth.auth().signInAnonymously()
                    AuthManager.shared.isLoggedIn=true
                    let user = try? authManager.getUser()
                    
                    print( user == nil)
                } else {
                    text="Failed"
                }
                
            }
            //If user isn't enrolled in face ID
        } else {
            print("no face id on this device")
        }
        
    }
}
/*
#Preview {
    BiometricView(authManager: <#AuthManager#>)
}*/
