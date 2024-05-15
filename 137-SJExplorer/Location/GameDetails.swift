//
//  GameDetails.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 5/13/24.
//

import SwiftUI

struct GameDetails: View {
    
    @Binding var gameSelect: Int?
    @Binding var show: Bool
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if (gameSelect == 1) {
                        Text("MLK LIbrary")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Welcome to the Martin Luther King Library")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .lineLimit(2)
                            .padding(.trailing)
                    } else if (gameSelect == 2) {
                        Text("Engineeing Building")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Welcome to the Engineering Building")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .lineLimit(2)
                            .padding(.trailing)
                    } else if (gameSelect == 3) {
                        Text("Dining Commons")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Welcome to the Dining Commons")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .lineLimit(2)
                            .padding(.trailing)
                    } 
                }
                
                Spacer()
                
                Button {
                    show.toggle()
                    gameSelect = 0
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray, Color(.systemGray6))
                }
            }
            
            if (gameSelect == 1) {
                /*
                NavigationLink(destination: Settings()) {
                    Label("Play", systemImage: "map")
                }
                */
                Button("Play"){
                    if let url = URL(string: "clickgame://") {
                        
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)    
                    }
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.black)
                .padding(10)
                .background(
                    Color.blue)
            }
        }
        .padding()
    }
}

#Preview {
    GameDetails(gameSelect: .constant(0), show: .constant(false))
}
