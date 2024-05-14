//
//  FriendsView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/14/24.
//

import SwiftUI

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
                    
                }
                
                
                
               
                
            }
        }
        // let userDocRef = db.collection("users").document(currentUser.uid)
    }
}

#Preview {
    FriendsView()
}
