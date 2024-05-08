//
//  LoginView.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/14/24.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password: String = ""
    
    enum LoginError: Error {
        case invalidCredentials
        
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Credentials not entered")
            throw LoginError.invalidCredentials
        }
        
                let userData = try await AuthManager.shared.signIn(email: email, password: password)
                
                print("Successful login")
                print(userData)
            } 
       
}

struct LoginView: View {
    
    @StateObject private var viewModel=LoginViewModel()
    
    @ObservedObject var authManager : AuthManager
    
    var fieldSpacing = ViewAttributes.shared.fieldSpacing
    var fieldWidth = ViewAttributes.shared.fieldWidth
    var fieldHeight = ViewAttributes.shared.fieldHeight
    var altSpacing = ViewAttributes.shared.altSpacing
    var body: some View {
        
            
        ZStack {
            
            
            VStack(alignment: .center) {
                Image(.logo).resizable().frame(width: 200, height: 200)
                
                Text("Sign In").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //Sign in fields
                
                TextField("Email", text: $viewModel.email).foregroundStyle(.black)
                
                    .autocorrectionDisabled(true)
#if !os(macOS)
                    .textInputAutocapitalization(.never)
                
#endif
                    .frame(width: fieldWidth, height: fieldHeight)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                
                Spacer().frame(height:fieldSpacing)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                //border of the button
                    .frame(width: fieldWidth, height: fieldHeight)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                
                Spacer().frame(height:fieldSpacing)
                
                
                
                
                /*
                 Sign In button
                 ACTION:
                 Take user to main page
                 
                 */
                Button {
                    Task {
                        do {
                            try await viewModel.signIn()
                            authManager.isLoggedIn=true
                        } catch {
                            print("incorrect credentials")
                        }
                    }
                    
                    
                } label: {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                }
                

                        Spacer().frame(height:fieldSpacing)
                        Text("Don't have an account?")
                        Spacer().frame(height:altSpacing)
                        
                        /*Button that takes the user to the register view*/
                Button {
                    
                    authManager.setIsRegistering(isRegistering: true)
                    
                } label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                }
                        /*NavigationLink(destination: RegisterView()) {
                            Text("Sign Up")
                        }
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )*/
                   
                    
                }
                
            
            
        }
        
        
        
    }
    
    
}

#Preview {
    LoginView(authManager: AuthManager.shared)
}
