//
//  AppCoordinator.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 05.03.2024.
//

import UIKit

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
        let vc = RocketScreenViewController()
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func finish() {
        
    }
}
