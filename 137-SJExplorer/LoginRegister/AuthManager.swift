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
    private init() {}
    
    func getUser() throws -> AuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthModel(user:user)
    }
    
    func createUser(email:String, password: String) async throws {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthModel(user: authDataResult.user)
    }
}
