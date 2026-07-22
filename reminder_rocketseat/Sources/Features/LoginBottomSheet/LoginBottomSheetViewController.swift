//
//  LogginBottomSheetViewController.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 17/07/26.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let loginView = LoginBottomSheetView()
    var handleAreaHeight: CGFloat = 50.0
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        
        setupUI()
        setupGesture()
    }
    
    // MARK: - UI Setup
    private func setupUI(){
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture(){
        
    }
    
    /// Recebe por parametro uma closure denominada completion (i.e., algo que complementa a função, que gera um efeito de ação em cascata)
    func animateShow(completion: (()-> Void)? = nil){
        self.view.layoutIfNeeded() /// Força a atualização do layout para poder ler a altura correta de loginView na sequencia
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height) /// Transformação de translação (move a view de login para baixo o mesmo tanto de sua altura (ou seja, até ela desaparecer) sem alterar suas constraints) -> força a view a "nascer" deslocada/escondida
        
        /// Consolida o movimento : retorna a view para a posição original das constraints de forma animada com duração de 0.3 segundos
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        print(user, password)
    }
}
