//
//  User.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 29/07/26.
//

import Foundation

/// Codable permite que o objeto user possa ser codificado e decodificado, pois o userdefault trabalha apenas com dados codificados
struct User: Codable {
    let email: String
    let isUserSaved: Bool
}
