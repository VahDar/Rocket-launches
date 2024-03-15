//
//  RocketScreenCoordinator.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit
import Swinject

final class RocketScreenCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var viewModel: RocketScreenViewModelProtocol
    
    init(navigationController: UINavigationController, _ viewModel: RocketScreenViewModelProtocol) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        openRocketViewController()
        guard let networkManager = Container.network.resolve(NetworkManagerProtocol.self) else { return }
        viewModel.networkManager = networkManager
        
    }
    
    func finish() {
        
    }
    
    private func openRocketViewController() {
        let viewController = RocketScreenViewController()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
    
    private func childScreen() {
        
    }
}

