//
//  RocketContainer.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 09.03.2024.
//

import Foundation
import Swinject

extension Container {
    static let rocket: Container = {
        let container = Container()
        
        container.register(RocketScreenViewModelProtocol.self) { r in
            let networkManager = r.resolve(NetworkManagerProtocol.self)!
           return RocketScreenViewModel(networkManager: networkManager)
        }
        return container
    }()
}
