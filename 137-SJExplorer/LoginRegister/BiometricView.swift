//
//  BiometricView.swift
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
                        authManager.authenticate()
                    }
                    Spacer()
                    .frame(height: 50)
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
        }
    }
    
    
}
/*
#Preview {
    BiometricView(authManager: <#AuthManager#>)
}*/
