//
//  RoketScreenViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import Foundation



final class RocketScreenViewModel: RocketScreenViewModelProtocol {
    
    var onAddLaunch: (() -> Void)?
    var networkManager: NetworkManagerProtocol!
    var rocketData: [RocketModel] = []
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
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
