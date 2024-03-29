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
        
        container.register(RocketScreenViewModelProtocol.self) { _ in
            RocketScreenViewModel()
        }
        return container
    }()
}
