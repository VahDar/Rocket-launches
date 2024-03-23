//
//  RoketScreenViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import Foundation
import Swinject


final class RocketScreenViewModel: RocketScreenViewModelProtocol {
    
    var onAddLaunch: (() -> Void)?
    var networkManager: NetworkManagerProtocol!
    var rocketData: [RocketModel] = []
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = Container.network.resolve(NetworkManagerProtocol.self)
    }

    
    func getRocketData() async {
        do {
            let data = try await networkManager.getRockets()
            rocketData = data
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
