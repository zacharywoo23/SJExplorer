//
//  ScoreView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/7/24.
//

import SwiftUI

struct ScoreView: View {
    var viewWidth = ViewAttributes.shared.viewWidth
    var viewHeight = ViewAttributes.shared.viewHeight
    
    var body: some View {
        ZStack {
            
            VStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: viewWidth, height: viewHeight/2)
                    .padding(10)
                    .foregroundColor(Color(hex: 0xd4b47c))
                    .position(x:viewWidth/2, y:viewHeight/3)
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: viewWidth, height: viewHeight/4)
                    .padding(10)
                    .foregroundColor(Color(hex: 0xd4b47c))
                    .position(x:viewWidth/2, y:viewHeight/4)
            }
            Text("Leaderboard")
                .font(.title)
                .background(Capsule()
                    .frame(width: viewWidth, height: 50)
                    .padding(10)
                    .foregroundColor(Color(hex: 0xdfa00a))
                    )
                .position(x:viewWidth/2, y:viewHeight/9)
            Text("Your score")
                .font(.title)
                .background(Capsule()
                    .frame(width: viewWidth, height: 50)
                    .padding(10)
                    .foregroundColor(Color(hex: 0xdfa00a))
                    )
                .position(x:viewWidth/2, y:viewHeight*7/11)
                
            
        }
    }
}

#Preview {
    ScoreView()
}
