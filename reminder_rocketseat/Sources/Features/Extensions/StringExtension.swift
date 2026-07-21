//
//  StringExtension.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 21/07/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
