//
//  LoginRegisterAttributes.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/15/24.

// Spacing for the login and register screens, vars shared for UI consistency
//

import Foundation

struct AuthAttributes {
    static var shared = AuthAttributes()
    
    var fieldWidth: Int = 100
    var fieldHeight: Int = 40
    
    
    var fieldSpacing: Int = 20
    private init() {}
}
