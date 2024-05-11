//
//  LoginRegisterAttributes.swift
//  SJExplorer
//
//  Created by Dennis Shih on 3/15/24.

// Spacing for the login and register screens, vars shared for UI consistency
//

import Foundation

struct ViewAttributes {
    static var shared = ViewAttributes()
    
    
   
    
    //Attributes for aligning text fields
    var fieldWidth: CGFloat = 150
    var fieldHeight: CGFloat = 40
    var fieldSpacing: CGFloat = 25
    
    
    //Spacing between the bottom text question (already have acc/don't have acc) and the respective alternative option
    var altSpacing: CGFloat = 20
    private init() {}
}
