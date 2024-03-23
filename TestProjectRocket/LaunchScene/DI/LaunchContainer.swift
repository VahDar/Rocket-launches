//
//  LaunchContainer.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 12.03.2024.
//

import Foundation
import Swinject

extension Container {
    static let launch: Container = {
       let container = Container()
        
        container.register(LaunchSceneViewModelProtocol.self) { r in
            let networkManager = r.resolve(NetworkManagerProtocol.self)!
           return LaunchSceneViewModel(networkManager: networkManager)
        }
        return container
    }()
}
