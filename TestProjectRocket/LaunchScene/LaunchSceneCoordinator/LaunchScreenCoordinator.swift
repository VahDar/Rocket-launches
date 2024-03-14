//
//  LaunchScreenCoordinator.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 14.03.2024.
//

import Foundation
import UIKit
import Swinject

class LaunchScreenCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var viewModel: LaunchSceneViewModelProtocol
    
    init(navigationController: UINavigationController, _ viewModel: LaunchSceneViewModelProtocol) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        openLaunshScreen()
        guard let networkManager = Container.network.resolve(NetworkManagerProtocol.self) else { return }
        viewModel.networkManager = networkManager
    }
    
    func finish() {
        removeChildCoordinator(self)
        navigationController.removeFromParent()
    }
    
    func openLaunshScreen() {
        let viewController = LaunchViewController()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
