//
//  RoketScreenViewModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import Foundation

struct RocketDetails {
    let name: String
    let height: Diameter
    let diameter: Diameter
    let mass: Mass
    let leoPayload: PayloadWeight?
}

final class RocketScreenViewModel: RocketScreenViewModelProtocol {
    var networkManager: NetworkManagerProtocol!
    var rocketData: [RocketModel] = []
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    func getRocketData() async {
        do {
            let data = try await networkManager.getRockets()
            var detailsArray = [RocketDetails]()
            
            for rocket in data {
                let name = rocket.name
                let height = rocket.height
                let diameter = rocket.diameter
                let mass = rocket.mass
                let leoPayload = rocket.payloadWeights.first { $0.id == "lep" }
                
                let details = RocketDetails(name: name, height: height, diameter: diameter, mass: mass, leoPayload: leoPayload)
                detailsArray.append(details)
                print(detailsArray)
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
