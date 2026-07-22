//
//  LoginBottomSheetViewDelegate.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 22/07/26.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject { /// AnyObject significa que qualquer coisa pode se conformar a essa protocolo
    func sendLoginData(user: String, password: String)
}
