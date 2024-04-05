//
//  Register.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/15/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    //Consent box checked
    @State private var isChecked: Bool = false
    
    var fieldSpacing = AuthAttributes.shared.fieldSpacing
    var fieldWidth = AuthAttributes.shared.fieldWidth
    var fieldHeight = AuthAttributes.shared.fieldHeight
    var altSpacing = AuthAttributes.shared.altSpacing
    
    
    var body: some View {
        //NavigationView {
            ZStack {
                //Gradient background
                
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7c9cd4), .yellow]), startPoint: .center, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                VStack(alignment: .center) {
                    Image(.logo).resizable().frame(width: 200, height: 200)
                    
                    Text("Sign Up").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    //Sign in fields
                    TextField(" Username", text: $username).foregroundStyle(.black)
                    
                        .autocorrectionDisabled(true)
#if !os(macOS)
                        .textInputAutocapitalization(.never)
#endif
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    //add border to this and SecureField
                    Spacer().frame(height:fieldSpacing)
                    
                    SecureField(" Password", text: $password)
                        .onSubmit {
                            //handleLogin(username: //username, password: //password)
                        }
                    //border of the button
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    Spacer().frame(height:fieldSpacing)
                    Text("Password should contain at least 6 characters including at least 1 number.")
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        HStack {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .foregroundColor(isChecked ? .accentColor : .secondary)
                            Text("I acknowledge my experience \nmay be impacted by limited internet connectivity.")
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                                .padding(.top, 45)
                        }
                    }
                    .padding(.top, -30)
                    
                    /*ACTION:
                     Create user account with the credentials entered
                     Send user to main page
                     */
                    
                    NavigationLink(destination: SJExplorer()) {
                        Text("Sign Up")
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                    
                    
                    
                    Spacer().frame(height: fieldSpacing)
                    Text("Already have an account?")
                    Spacer().frame(height: altSpacing)
                    /*ACTION:
                     Take user to Login view
                     */
                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                    
                    
                    
                    
                }
            }
            
            
        //}
    }
    
}

//The custom theme color used in the background
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}


#Preview {
    RegisterView()
}
