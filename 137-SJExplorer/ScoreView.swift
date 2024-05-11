//
//  ScoreView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/7/24.
//

import SwiftUI

struct ScoreView: View {
   
    
    
    var body: some View {
        GeometryReader { geo in
                    
            ZStack {
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: geo.size.width, height: geo.size.height/2)
                        .padding(10)
                        .foregroundColor(Color(hex: 0xd4b47c))
                        
                        .position(x:geo.size.width/2, y:geo.size.height/3)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: geo.size.width, height: geo.size.height/4)
                        .padding(10)
                        .foregroundColor(Color(hex: 0xd4b47c))
                        .position(x:geo.size.width/2, y:geo.size.height/4)
                }
                
                Text("Leaderboard")
                    .font(.title)
                    .background(Capsule()
                        .frame(width: geo.size.width, height: 50)
                        .padding(10)
                        .foregroundColor(Color(hex: 0xdfa00a))
                        )
                    .position(x:geo.size.width/2, y:geo.size.height/9)
                Text("Your score")
                    .font(.title)
                    .background(Capsule()
                        .frame(width: geo.size.width, height: 50)
                        .padding(10)
                        .foregroundColor(Color(hex: 0xdfa00a))
                        )
                    .position(x:geo.size.width/2, y:geo.size.height*7/11)
                    
                
            }
                }
        
    }
}


#Preview {
    ScoreView()
}
