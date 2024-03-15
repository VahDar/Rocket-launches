//
//  AppCoordinator.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 05.03.2024.
//

import UIKit
import Swinject

protocol AppCoordinatorProtocol: Coordinator {
    var window: UIWindow? { get }
}

class AppCoordinator: AppCoordinatorProtocol {
    
    let window: UIWindow?
    var childCoordinator: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
       openRocketScreen()
        
    }
    
    func finish() {
        
    }
    
    private func openRocketScreen() {
        guard let viewModel = Container.rocket.resolve(RocketScreenViewModelProtocol.self) else { return }
        let rocketCoordinator = RocketScreenCoordinator(navigationController: navigationController, viewModel)
        rocketCoordinator.start()
        addChildCoordinator(rocketCoordinator)
    }
}
