//
//  MainPageView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/11/24.
//

import SwiftUI



struct MainPageView: View {
    
    //@ObservedObject var authManager : AuthManager
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                        .frame(width: geo.size.width, height: geo.size.height) // Extend the gradient to cover the whole screen
                        .ignoresSafeArea()
                        .position(x:geo.size.width/2, y: geo.size.height/2)
                    VStack {
                        Image(.logo).resizable().frame(width: 100, height: 100)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: geo.size.width, height: geo.size.height*2/3)
                            .padding(10)
                            .position(x:geo.size.width/2, y:geo.size.height/3)
                            .foregroundColor(Color(hex: 0xdfa00a))
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: geo.size.width, height: geo.size.height/2)
                            .padding(10)
                            .position(x:geo.size.width/2, y:geo.size.height*2/5)
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
                        NavigationLink(destination: FriendsView()) {
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
                        Spacer()
                            .frame(height:150)
                        
                        Image(.bird).resizable()
                            .frame(width: 50, height: 50)
                        Text("FlappySpartan")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Button("Play") {
                            if let url = URL(string: "unitygame://") {
                                
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                
                            }
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width*3/4)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(Color.blue))
                        
                    }
                    .position(x:geo.size.width/2, y:geo.size.height*5/7)
                }
                
            }
        }
    }
    
}


    #Preview {
    MainPageView()
}
