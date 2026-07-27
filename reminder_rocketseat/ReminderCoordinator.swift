//
//  ReminderCoordinator.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 27/07/26.
//

import Foundation
import UIKit

class ReminderCoordinator{
    // MARK: - Properties
    private var navigationController: UINavigationController?
//    private let viewControllerFactory
    
    // MARK: - init
    public init() {
        
    }
    
    //MARK: Startflow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(coordinatorDelegate: self)
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return self.navigationController
    }
}

// MARK: - Login
extension ReminderCoordinator: LoginBottomSheetCoordinatorDelegate {
    func navigateToHome() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        
        self.navigationController?.dismiss(animated: true)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Splash
extension ReminderCoordinator: SplashCoordinatorDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(coordinatorDelegate: self) // cria a view de login bottom sheet
        loginBottomSheet.modalPresentationStyle = .overCurrentContext // configura sua forma de apresentação
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        
        self.navigationController?.present(loginBottomSheet, animated: false){ // apresenta ela na tela
            loginBottomSheet.animateShow()
        }
    }
}
