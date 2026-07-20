//
//  SplashViewController.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 08/07/26.
//

import Foundation
import UIKit

// Essa classe herda de UIViewController
class SplashViewController: UIViewController {
    let contentView = SplashView()
    
    // MARK: - Ciclo de vida da tela
    
    // sobrescrevendo método da superclasse
    override func viewDidLoad() {
        super.viewDidLoad() // construtor da classe pai
        setup()
        
    } // Chamada após a view do controler ter sido carregada em memória (primeira coisa que aparece)
    
    private func setup(){
        self.view.backgroundColor = Colors.redBase
        self.view.addSubview(contentView)
        
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        // Ancora da splash fica alinhada com a ancora da view do VC
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // todas as propriedades precisam ter essa flag desmarcada para não serem interpretadas como um story board
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet(){
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        
        self.present(loginBottomSheet, animated: false){
            loginBottomSheet.animateShow()
        }
    }
}
