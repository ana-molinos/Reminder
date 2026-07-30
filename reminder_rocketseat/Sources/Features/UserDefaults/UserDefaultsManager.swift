//
//  UserDefaultsManager.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 29/07/26.
//

import Foundation

// Gerencia o chace do aplicativo
class UserDefaultsManager {
    private static let userKey = "userKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        return nil
    }
}
