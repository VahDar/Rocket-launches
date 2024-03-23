//
//  LaunchSceneViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 12.03.2024.
//

import Foundation
import Swinject

class LaunchSceneViewModel: LaunchSceneViewModelProtocol {
    
    var launchData: [LaunchModel] = []
    var networkManager: NetworkManagerProtocol!
    var rocketID: String?
    
    init(networkManager: NetworkManagerProtocol, rocketID: String? = nil) {
        self.networkManager = Container.network.resolve(NetworkManagerProtocol.self)
        self.rocketID = rocketID
    }
    
    func getLaunchData() async {
           do {
               let allLaunches = try await networkManager.getLaunchData()
               // Фильтруем полученные данные о запусках по rocketID, если он есть
               if let rocketID = rocketID {
                   launchData = allLaunches.filter { $0.rocket.rawValue == rocketID }
               } else {
                   launchData = allLaunches
               }
               print(launchData)
           } catch {
               debugPrint(error.localizedDescription)
           }
       }
   }
