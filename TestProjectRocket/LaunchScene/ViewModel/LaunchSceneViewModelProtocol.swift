//
//  LaunchSceneViewModelProtocol.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 12.03.2024.
//

import Foundation

protocol LaunchSceneViewModelProtocol {
    var launchData: [LaunchModel] { get set }
    var networkManager: NetworkManagerProtocol! { get set }
    func getLaunchData() async
}
