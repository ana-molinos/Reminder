//
//  ViewControllersFactory.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 28/07/26.
//

import Foundation

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(coordinator: any SplashCoordinatorDelegate) -> SplashViewController {
        let viewController = SplashViewController(coordinatorDelegate: coordinator)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(coordinator: any LoginBottomSheetCoordinatorDelegate) -> LoginBottomSheetViewController {
        let viewController = LoginBottomSheetViewController(coordinatorDelegate: coordinator)
        return viewController
    }
}
