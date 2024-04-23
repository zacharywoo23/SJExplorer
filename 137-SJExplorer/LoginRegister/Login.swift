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
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Credentials not entered")
            return
        }
        //change to fetch the existing user with correct credentials
        Task {
            do {
                let userData: () = try await AuthManager.shared.createUser(email: email, password: password)
                print("Successful login")
                print(userData)
            } catch {
                print("error: \(error)")
            }
        }
    }
}

struct LoginView: View {
    
    @StateObject private var viewModel=LoginViewModel()
    
    @ObservedObject var authManager : AuthManager
    
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
                    viewModel.signIn()
                } label: {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                }
                /*NavigationLink(destination: SJExplorer()) {
                 Text("Sign in")
                 }
                 .foregroundStyle(.white)
                 .padding(10)
                 .background(
                 Capsule()
                 .fill(Color.blue)
                 )
                 */
                
                Text("or")
                /*
                 Face ID sign in, take user to biometric page
                 */
                Button {
                    authManager.setUsingBioLogin(usingBio: true)
                    authManager.setIsRegistering(isRegistering: false)
                    print(authManager.isUsingBioLogin)
                } label: {
                    Text("Use Face ID to sign in")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Rectangle()
                                .fill(Color.secondary))
                    
                }
                /*NavigationLink(destination: BiometricView()) {
                            Text("Use Face ID to sign in")
                        }
                        .foregroundStyle(Å.white)
                        .padding(10)
                        .background(
                            Rectangle()
                                .fill(Color.secondary)
                        )*/
                        
                    
                        Spacer().frame(height:fieldSpacing)
                        Text("Don't have an account?")
                        Spacer().frame(height:altSpacing)
                        
                        /*Button that takes the user to the register view*/
                Button {
                    authManager.setUsingBioLogin(usingBio: false)
                    authManager.setIsRegistering(isRegistering: true)
                    print(authManager.isUsingBioLogin)
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
