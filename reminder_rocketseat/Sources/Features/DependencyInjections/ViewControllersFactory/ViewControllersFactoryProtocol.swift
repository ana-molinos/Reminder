//
//  ViewControllersFactoryProtocol.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 28/07/26.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(coordinator: SplashCoordinatorDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(coordinator: LoginBottomSheetCoordinatorDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(coordinator: HomeCoordinatorDelegate) -> HomeViewController
}
