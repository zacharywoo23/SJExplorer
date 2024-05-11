//
//  Settings.swift
//  137-SJExplorer
//
//  Created by Dennis Shih on 5/7/24.
//

import SwiftUI

struct Settings: View {
    @StateObject var authManager = AuthManager()
    var body: some View {
        Button("Sign Out"){
        authManager.signOut()
        }
        .foregroundStyle(.black)
        .padding(10)
        .background(
        Capsule()
        .fill(Color.blue)
        )
    }
}

#Preview {
    Settings()
}
