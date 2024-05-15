//
//  Register.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/15/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email = ""
    @Published var password: String = ""
    
    
    
    
    enum RegistrationError: Error {
        case invalidCredentials
        case passwordTooShort
    }
    
    func register() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Credentials invalid")
            throw RegistrationError.invalidCredentials
        }
        guard !(password.count < 6) else {
            print("Password must be at least 6 characters")
            throw RegistrationError.passwordTooShort
        }
        
        
        let userData = try await AuthManager.shared.createUser(email: email, password: password)
        
        guard let currentUser = Auth.auth().currentUser else {
            // User is not logged in
            return
        }
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(currentUser.uid)
        
        //Add username to the collection
        userDocRef.setData(["username": name], merge: true) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document updated successfully with username: \(self.name)")
            }
        }
        userDocRef.setData(["email": email], merge: true) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document updated successfully with email: \(self.email)")
            }
        }

        
        print("Successful register")
        print(userData)
        
        
        
        
    }
}

struct RegisterView: View {
    
    //Consent box checked
    @State private var isChecked: Bool = false
    @StateObject private var viewModel=RegisterViewModel()
    @ObservedObject var authManager : AuthManager
    
    var fieldSpacing = ViewAttributes.shared.fieldSpacing
    var fieldWidth = ViewAttributes.shared.fieldWidth
    var fieldHeight = ViewAttributes.shared.fieldHeight
    var altSpacing = ViewAttributes.shared.altSpacing
    
    
    var body: some View {
        //NavigationView {
            ZStack {

                VStack(alignment: .center) {
                    Image(.logo).resizable().frame(width: 200, height: 200)
                    
                    Text("Sign Up").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    //Register fields
                    
                    TextField("Userame", text: $viewModel.name).foregroundStyle(.black)
                    
                        .autocorrectionDisabled(true)
#if !os(macOS)
                        .textInputAutocapitalization(.never)
#endif
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    
                    
                    Spacer().frame(height:fieldSpacing)
                    TextField("Email", text: $viewModel.email).foregroundStyle(.black)
                    
                        .autocorrectionDisabled(true)
#if !os(macOS)
                        .textInputAutocapitalization(.never)
#endif
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    
                    Spacer().frame(height:fieldSpacing)
                    
                    SecureField(" Password", text: $viewModel.password)
                        
                        .frame(width: fieldWidth, height: fieldHeight)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    Spacer().frame(height:fieldSpacing)
                    Text("Password should contain at least 6 characters")
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
                    
                    Button {
                        if !isChecked {
                            print("You must check the agreement box.")
                        } else {
                            
                            Task {
                                do {
                                    try await viewModel.register()
                                    authManager.isLoggedIn=true
                                    authManager.setIsRegistering(isRegistering: false)
                                    authManager.authenticate()
                                    
                                } catch {
                                    print("Try again")
                                }
                            }
                        }
                        
                        
                    } label: {
                        Text("Sign Up")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(
                                Capsule()
                                    .fill(Color.blue)
                            )
                    
                    }
  
                    Spacer().frame(height: fieldSpacing)
                    Text("Already have an account?")
                    Spacer().frame(height: altSpacing)
                    /*ACTION:
                     Take user to Login view
                     */
                    Button {
                        
                        authManager.setIsRegistering(isRegistering: false)
                    } label: {
                        Text("Sign In")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(
                                Capsule()
                                    .fill(Color.blue)
                            )
                    
                    }
 
                }
            }

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
    RegisterView(authManager: AuthManager.shared)
}
