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
    
    var body: some View {
        VStack(alignment: .center) {
            Image(.logo).resizable().frame(width: 200, height: 200)
            
            Text("Sign In").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            //Sign in fields
            TextField("Username", text: $username).foregroundStyle(.blue)
                
                        .autocorrectionDisabled(true)
                        #if !os(macOS)
                        .textInputAutocapitalization(.never)
                        #endif
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 100)
                        //add border to this and SecureField
            SecureField("Password", text: $password)
                        .onSubmit {
                            //handleLogin(username: //username, password: //password)
                        }
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
