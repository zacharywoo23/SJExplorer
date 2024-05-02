//
//  RequestLocation.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 4/4/24.
//

import SwiftUI
import MapKit

struct RequestLocation: View {
    let cBlue = Color(hex: 0x7C9CD4, alpha: 0.6)
    let cBlue2 = Color(hex: 0x7C9CD4, alpha: 1.0)
    var body: some View {
        ZStack {
            Color(cBlue).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(.logo).resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 32)
                
                Text("Ready to play?").font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Start sharing!").multilineTextAlignment(.center)
                    .frame(width: 140)
                    .padding()
                
                Spacer()
                
                VStack {
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow Location").padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    
                    Button {
                        print("Dismiss")
                    } label: {
                        Text("Maybe Later")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 32)
                
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    RequestLocation()
}
