//
//  MainPageView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/11/24.
//

import SwiftUI

struct MainPageView: View {
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
            ZStack {
                
                VStack {
                    Image(.logo).resizable().frame(width: 100, height: 100)
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: geo.size.width, height: geo.size.height*2/3)
                        .padding(10)
                        .position(x:geo.size.width/2, y:geo.size.height/3)
                        .foregroundColor(Color(hex: 0xdfa00a))
                }
                
                    Text("  Home")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.blue)
                        .background(
                            Capsule()
                                .fill(Color(hex: 0xFfc10f))
                                .frame(width:geo.size.width, height:50))
                        .position(x:geo.size.width/2, y:geo.size.height/6)
                    
                    VStack{
                        Spacer()
                            .frame(height:100)
                        NavigationLink(destination: Maps()) {
                            Label("Explore", systemImage: "map")
                        }
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(
                            Color.blue)
                        
                        
                        Spacer()
                            .frame(height:50)
                        NavigationLink(destination: ScoreView()) {
                            Label("Scores", systemImage: "chart.bar.fill")
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(
                            Color.blue)
                        
                        
                        
                        Spacer()
                            .frame(height:50)
                        NavigationLink(destination: HomeTabs()) {
                            Label("Friends", systemImage: "person.3.fill")
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(
                            Color.blue)
                        
                        Spacer()
                            .frame(height:50)
                        NavigationLink(destination: Settings()) {
                            
                            Label("Settings", systemImage: "gearshape")
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(
                            Color.blue)
                        
                        
                        
                        
                        
                        
                        //move to settings page
                        /*
                         
                         */
                    }
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
