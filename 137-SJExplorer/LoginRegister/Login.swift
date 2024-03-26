//
//  ContentView.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var fieldSpacing = AuthAttributes.shared.fieldSpacing
    var fieldWidth = AuthAttributes.shared.fieldWidth
    var fieldHeight = AuthAttributes.shared.fieldHeight
    var altSpacing = AuthAttributes.shared.altSpacing
    var body: some View {
        
        ZStack {
            
            //May change accordingly depending on visbility on iphone
            
            //Gradient background
            
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7c9cd4), .yellow]), startPoint: .center, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image(.logo).resizable().frame(width: 200, height: 200)
                
                Text("Sign In").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //Sign in fields
                
                TextField(" Username", text: $username).foregroundStyle(.blue)
                    
                            .autocorrectionDisabled(true)
                            #if !os(macOS)
                            .textInputAutocapitalization(.never)
                            #endif
                            .frame(width: fieldWidth, height: fieldHeight)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                            
                Spacer().frame(height:fieldSpacing)
                
                SecureField(" Password", text: $password)
                            .onSubmit {
                                //handleLogin(username: //username, password: //password)
                            }
                            //border of the button
                            .frame(width: fieldWidth, height: fieldHeight)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                
                Spacer().frame(height:fieldSpacing)
                Button(action: {
                    //action
                }) {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer().frame(height:fieldSpacing)
                Text("Don't have an account?")
                Spacer().frame(height:altSpacing)
                Button(action: {
                    //action
                }) {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                }
                
                
            }
            .padding()
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
