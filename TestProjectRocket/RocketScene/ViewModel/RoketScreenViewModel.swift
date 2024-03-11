//
//  RoketScreenViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import Foundation



final class RocketScreenViewModel: RocketScreenViewModelProtocol {
    var networkManager: NetworkManagerProtocol!
    var rocketData: [RocketModel] = []
    var currentRocker: RocketModel?
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
//    func selectRocket() {
//        guard !rocketData.isEmpty else { return }
//        currentRocker = rocketData
//    }
    
    func getRocketData() async {
        do {
            let data = try await networkManager.getRockets()
            rocketData = data
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
