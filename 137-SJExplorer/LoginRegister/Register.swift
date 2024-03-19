//
//  Register.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/15/24.
//

import SwiftUI


struct Register: View {
    @State private var username: String = ""
    @State private var password: String = ""
    //Consent box checked
    @State private var isChecked: Bool = false
    
    var fieldSpacing = CGFloat(AuthAttributes.shared.fieldSpacing)
    var fieldWidth = CGFloat(AuthAttributes.shared.fieldWidth)
    var fieldHeight = CGFloat(AuthAttributes.shared.fieldHeight)
    
    var body: some View {
        VStack(alignment: .center) {
            Image(.logo).resizable().frame(width: 200, height: 200)
            
            Text("Sign Up").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            //Sign in fields
            TextField(" Username", text: $username).foregroundStyle(.blue)
                
                        .autocorrectionDisabled(true)
                        #if !os(macOS)
                        .textInputAutocapitalization(.never)
                        #endif
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                        //add border to this and SecureField
            Spacer().frame(height:fieldSpacing)
            
            SecureField(" Password (Include at least 1 letter and 1 special character)", text: $password)
                        .onSubmit {
                            //handleLogin(username: //username, password: //password)
                        }
                        //border of the button
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
            
            Button(action: {
                        isChecked.toggle()
                    }) {
                        HStack {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .foregroundColor(isChecked ? .accentColor : .secondary)
                            Text("I acknowledge my current experience may be impacted by limited internet connectivity.")
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                                .padding(.top, 45)
                        }
                    }
                    .padding(.top, -30)
            
            Button("Sign up") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding()
            
        }
        
        .padding()
        
    }
}

#Preview {
    Register()
}
