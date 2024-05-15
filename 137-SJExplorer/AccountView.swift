//
//  AccountView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih
//

import SwiftUI
import Firebase
import FirebaseAuth

struct AccountView: View {

    @State var username: String = "Please wait..."
    var numFriends = 0
    let user = Auth.auth().currentUser
    let db = Firestore.firestore()
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
                    Spacer()
                        .frame(height:80)
                    
                }
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Text("Your account")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .underline()
                        .position(x:geo.size.width/2, y:geo.size.width*2/5)
                    Text(username)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .position(x:geo.size.width/2, y:-geo.size.height/15)
                    //show user email
                    HStack {
                        Text("Email: ")
                        if user?.email != nil {
                            let email=user?.email
                            Text("\(email!)")
                        }
                    }
                    .position(x:geo.size.width/2, y:-geo.size.height/3)
                   
                    
                    
                    
                }
                .onAppear{
                    Task{
                        let result = await setUsername()
                    }
                    
                }
                
            }
        }

        
    }
    func setUsername() async {
            if let currentUser = Auth.auth().currentUser {
                let uid = currentUser.uid
                let db = Firestore.firestore()
                
                // Assuming you have a 'users' collection in Firestore
                let ref = db.collection("users").document(uid)
                
                do {
                        let document = try await ref.getDocument()
                        if document.exists {
                            if let username = document.data()?["username"] as? String {
                                self.username = username
                            } else {
                                print("Username not found")
                            }
                        } else {
                            print("Document doesnt exist")
                        }
                    } catch {
                        print("\(error)")
                    }
            } else {
                print("User is not signed in.")
            }
        }
   
}

#Preview {
    AccountView()
}
