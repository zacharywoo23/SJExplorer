//
//  Authentication.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 4/10/24.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

struct AuthModel {
    let uid:String
    let email:String?
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    @Published var isLoggedIn = false
    @Published var isUsingBioLogin = false
    @Published var isRegistering = false
    
    
    
    init() {}
    //gets the current user if logged in
    func getUser() throws -> AuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthModel(user:user)
    }
    //creates a new user
    func createUser(email:String, password: String) async throws {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthModel(user: authDataResult.user)
        Auth.auth().currentUser?.email
    }
    //sign out the user
    func signOut() {
        do {
            print("Signed out user ", Auth.auth().currentUser?.email)
            try Auth.auth().signOut()
            
            isLoggedIn = false
        } catch let signOutError as NSError {
            
            print("Error signing out: ", signOutError)
        }
    }
    
    func setUsingBioLogin(usingBio: Bool) {
        self.isUsingBioLogin=usingBio
        
        
    }
    
    func setIsRegistering(isRegistering: Bool) {
        self.isRegistering=isRegistering
        
        
    }
}
