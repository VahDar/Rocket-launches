//
//  NetworkContainer.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import Foundation
import Swinject

extension Container {
    static let network: Container = {
        let container = Container()
        
        container.register(NetworkManagerProtocol.self) { _ in
            NetworkManager()
        }
        
        return container
    }()
}
