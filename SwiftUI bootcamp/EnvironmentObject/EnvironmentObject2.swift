//
//  EnvironmentObject2.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 04/06/25.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var username: String = "Murodjon"
    @Published var isLoggedIn: Bool = false
    
    func login() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
    
    func updateUsername(newUsername: String) {
        username = newUsername
    }
}

