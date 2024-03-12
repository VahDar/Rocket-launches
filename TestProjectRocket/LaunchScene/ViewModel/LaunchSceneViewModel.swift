//
//  LaunchSceneViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 12.03.2024.
//

import Foundation

class LaunchSceneViewModel: LaunchSceneViewModelProtocol {
    
    var launchData: [LaunchModel] = []
    var networkManager: NetworkManagerProtocol!
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getLaunchData() async {
        do {
            let data = try await networkManager.getLunchData()
            launchData = data
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    
}
