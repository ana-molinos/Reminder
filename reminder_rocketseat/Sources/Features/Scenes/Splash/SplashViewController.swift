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
    let contentView: SplashView
    public weak var coordinatorDelegate: SplashCoordinatorDelegate?
    
    init(contentView: SplashView, coordinatorDelegate: SplashCoordinatorDelegate) {
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ciclo de vida da tela
    
    // sobrescrevendo método da superclasse
    override func viewDidLoad() {
        super.viewDidLoad() // construtor da classe pai
        setup()
        startAnimation()
        
    } // Chamada após a view do controler ter sido carregada em memória (primeira coisa que aparece)
    
    private func decideNavigationFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            self.coordinatorDelegate?.navigateToHome()
        } else {
            self.showLoginBottomSheet()
        }
    }
    
    private func setup(){
        self.view.backgroundColor = Colors.redBase
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(contentView)
        
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: self.contentView)
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture) // captura o toque em qualquer lugar a tela de splash screen
    }
    
    @objc
    private func showLoginBottomSheet(){ // Ao toque, executa esse bloco de código...
        animateLogoUp()
        coordinatorDelegate?.openLoginBottomSheet()
    }
}

// MARK: - Animations
extension SplashViewController{
    private func startAnimation() {
        UIView.animate(withDuration: 1.5,
                       delay: 0.0,
                       animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        },
                        completion: { _ in
            self.decideNavigationFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.2,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -150)
        })
    }
}
