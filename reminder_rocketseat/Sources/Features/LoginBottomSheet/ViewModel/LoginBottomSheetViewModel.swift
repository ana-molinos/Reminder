//
//  LoginBottomSheetViewModel.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 24/07/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    func doAuth(username: String, password: String){
        print("username: " + username)
        
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print("Falha na autenticação: \(error)")
            } else {
                print(authResult, "Sucesso na autenticação")
            }
        }
    }
}
