//
//  SwiftUIView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 3/26/24.
//

import SwiftUI

struct Biometric: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7c9cd4), .yellow]), startPoint: .center, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                Image("face")
                    .resizable()
                    .frame(width: 350, height: 350)
                Spacer()
                    .frame(height: 50)
                Text("Please scan your face")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            }
        }
        //Actual face scan logic to be implemented
       
    }
}

#Preview {
    Biometric()
}
