//
//  ViewControllersFactory.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 28/07/26.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(coordinator: any SplashCoordinatorDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView, coordinatorDelegate: coordinator)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(coordinator: any LoginBottomSheetCoordinatorDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView, coordinatorDelegate: coordinator)
        return viewController
    }
}
