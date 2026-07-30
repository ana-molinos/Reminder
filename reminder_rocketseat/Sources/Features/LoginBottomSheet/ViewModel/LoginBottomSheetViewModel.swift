//
//  LoginBottomSheetViewModel.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 24/07/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    
    var succesResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    /// "variável que retorna um bloco de código"
    
    func doAuth(username: String, password: String){
        
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            
            if let error = error {
                self?.errorResult?(error.localizedDescription)
            } else {
                self?.succesResult?(username)
            }
        }
    }
}
