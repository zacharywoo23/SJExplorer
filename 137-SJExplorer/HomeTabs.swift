//
//  HomeTabs.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 5/1/24.
//

import SwiftUI

struct HomeTabs: View {
    
    let cBlue = Color(hex: 0x7C9CD4, alpha: 0.6)
    let cBlue2 = Color(hex: 0x7C9CD4, alpha: 1.0)
    var body: some View {
        ZStack {
            
            TabView {
                
                MainPageView()
                    //.badge("!")
                    .tabItem {
                        Label("Home", systemImage: "house")
                            
                    }
                
                Maps()
                    .tabItem {
                        Image(.logo1).scaledToFit()
                    }
                    .toolbarBackground(cBlue, for: .tabBar)
                
                
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
            
            }
            

        }
        .onAppear{
            if !AuthManager.shared.isBioAuthenticated
            {
                AuthManager.shared.authenticate()
                
                
            }
            
        }
    }
}

#Preview {
    HomeTabs()
}
