//
//  FriendsView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/14/24.
//

import SwiftUI
import FirebaseFirestore

struct FriendsView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    Image(.logo).resizable().frame(width: 100, height: 100)
                        //.position(x:geo.size.width/2, y:geo.size.height/3)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 400, height: 350)
                        .padding(10)
                        .foregroundColor(Color(hex: 0x7C91aa))
                        .position(x:geo.size.width/2, y:geo.size.width/2)
                    
                    
                }
                VStack {
                    
                    Text("Friends")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    
                    Spacer()
                        .frame(height:200)
                    
                }
                
            }
        }
        // let userDocRef = db.collection("users").document(currentUser.uid)
    }
    func addFriendToUser(email: String, friendID: String) {
        let db = Firestore.firestore()
        
        // Get the user document based on the email
        db.collection("users").whereField("email", isEqualTo: email)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                for document in documents {
                    var data = document.data()
                    var friends = data["friends"] as? [String] ?? [String]()
                    friends.append(friendID)
                    data["friends"] = friends
                    
                    // Update the document with the new "friends" attribute
                    db.collection("users").document(document.documentID)
                        .setData(data) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                            } else {
                                print("Friend added to user successfully!")
                            }
                        }
                }
            }
    }
}

#Preview {
    FriendsView()
}
