//
//  Authentication.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 4/10/24.
//

import Foundation
import Firebase
import FirebaseAuth
import LocalAuthentication
import SwiftUI
import UserNotifications

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
    @Published var isBioAuthenticated = false
    @Published var isRegistering = false
    @Published var notificationsOn = false
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        authStateHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
    //gets the current user if logged in
    func getUser() throws -> AuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthModel(user:user)
    }
    
   
    //creates a new user
    func createUser(email:String, password: String) async throws -> AuthModel {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return AuthModel(user: result.user)
        
        
    }
    
    //sign in existing usr
    func signIn(email:String, password: String) async throws -> AuthModel {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return AuthModel(user: result.user)
        
    }
    
    //Biometric authentication leads to login
    func authenticate() {
        let context=LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "security") { success, authenticationError in
                
                if success {
                    
                    DispatchQueue.main.async {
                        self.setIsBioAuthenticated(isBioAuthenticated: true)
                        
                        
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        
                        print("failed to authenticate")
                        self.signOut()
                    }                }
                
            }
            //If user isn't enrolled in face ID
        } else {
            print("no face id on this device")
        }
        
    }
    
    

    //sign out the user
    func signOut() {
        do {
            print("Signed out user ", Auth.auth().currentUser?.email)
            try Auth.auth().signOut()
            
            self.isLoggedIn = false
            self.isBioAuthenticated=false
        } catch let signOutError as NSError {
            
            print("Error signing out: ", signOutError)
        }
    }
    
    //Delete the current user
    func deleteAccount(){
        let user = Auth.auth().currentUser
        let db = Firestore.firestore()
        let ref = db.collection("users").document(user!.uid)
        ref.delete { error in
            if let error = error {
                print("Error deleting document: \(error.localizedDescription)")
            } else {
                print("Document deleted successfully")
                self.isLoggedIn = false
                self.isBioAuthenticated=false
            }
        }

        user?.delete { error in
          if let error = error {
            // An error happened.
          } else {
            // Account deleted.
          }
        }
    }
    
    func createNotification(title: String, body: String, date: Date) {
            // Create the notification content
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = UNNotificationSound.default

            // Create a trigger for the notification
            let calendar = Calendar.current
            let triggerDate = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

            // Create the request for the notification
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            // Add the request to the notification center
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully.")
                }
            }
        }
    
    func setIsBioAuthenticated(isBioAuthenticated: Bool) {
        self.isBioAuthenticated=isBioAuthenticated
        
        
    }
    
    
    func setIsRegistering(isRegistering: Bool) {
        self.isRegistering=isRegistering
        
        
    }
}
