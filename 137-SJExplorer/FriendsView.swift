//
//  FriendsView.swift
//  137-SJExplorer
//
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct FriendsView: View {
    @State private var friendMail = ""
    @State private var friends: [String] = []
    let db = Firestore.firestore()
    let currentUserEmail = Auth.auth().currentUser?.email
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    Image(.logo).resizable().frame(width: 100, height: 100)
                        //.position(x:geo.size.width/2, y:geo.size.height/3)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 400, height: 600)
                        .padding(10)
                        .foregroundColor(Color(hex: 0x7C91aa))
                        .position(x:geo.size.width/2, y:geo.size.width*3/4)
                    
                    
                }
                VStack {
                    Spacer()
                        .frame(height:20)
                    Text("Friends")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Spacer()
                        .frame(height:20)
                    Text("Add friends by email")
                    TextField("Friend's email", text: $friendMail)
                        .frame(width: geo.size.width/2, height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 2))
                    Button("Add"){
                        
                        addFriend(friendEmail: friendMail)
                    }
                    .foregroundStyle(.black)
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                    Spacer()
                        .frame(height:50)
                    
                    List {
                                ForEach(friends, id: \.self) { friend in
                                    Text(friend)
                                        /*.listRowBackground(Color(hex: 0x7C91aa))*/
                                     
                                }
                                .listRowBackground(Color(hex: 0x7C91aa))
                        if (friends.isEmpty){
                            Text("No friends yet")
                                
                        }
                               
                            }
                    .scrollDisabled(true)
                    
                    
                    .frame(width:geo.size.width*3/4, height: 300)
                    
                    
                }
                
                .onAppear{
                    let userRef = db.collection("users").whereField("email", isEqualTo: currentUserEmail)
                    userRef.getDocuments { (querySnapshot, error) in
                            guard let documents = querySnapshot?.documents else {
                                print("Error getting friends: \(error!)")
                                return
                            }

                            for document in documents {
                                
                                if let friendList = document.data()["friends"] as? [String] {
                                    
                                    for f in friendList {
                                        friends.append(f)
                                    }
                                } else {
                                    print("No friends")
                                }
                            }
                        }
                }
                
            }
        }
        // let userDocRef = db.collection("users").document(currentUser.uid)
    }
    
    //adds friends to this user
    func addFriend(friendEmail: String) {
        
        
        let userRef = db.collection("users").whereField("email", isEqualTo: currentUserEmail)
        
        // Check if user exists
        userRef.getDocuments { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }

                for document in documents {
                    // Update the document to add the friend attribute
                    let userDocRef = db.collection("users").document(document.documentID)
                                userDocRef.updateData(["friends": FieldValue.arrayUnion([friendEmail])]) { error in
                                    if let error = error {
                                        print("Error updating document: \(error)")
                                    } else {
                                        print("Added friend \(friendEmail) ")
                                        self.friends.append(friendEmail)
                                    }
                                }
                }
            }
    }
    
}

#Preview {
    FriendsView()
}
