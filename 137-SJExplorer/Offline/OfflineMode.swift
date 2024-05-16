//
//  OfflineMode.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 5/1/24.
//

import SwiftUI

struct OfflineMode: View {
    let cBlue = Color(hex: 0x7C9CD4, alpha: 0.6)
    let cBlue2 = Color(hex: 0x7C9CD4, alpha: 1.0)
    let cWhite = Color(hex: 0xF2F5FB, alpha: 1.0)
    var body: some View {
        ZStack {
            Color(cBlue).ignoresSafeArea()
            
            VStack {
                Image(systemName: "wifi.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(cWhite)
                
                Text("Not connected to the internet")
                    .font(.system(size: 28))
                    .padding()
                    .foregroundColor(cWhite)
                Text("Exploring is unavailable while offline.")
                    .font(.system(size: 25))
                    .padding()
                    .foregroundColor(cWhite)

                
                Image(.logo).resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 32)
                    .grayscale(1.0)
            }
        }
    }
}

#Preview {
    OfflineMode()
}
