//
//  RocketScreenViewModelProtocol.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 09.03.2024.
//

import Foundation

protocol RocketScreenViewModelProtocol {
    var rocketData: [RocketModel] { get set }
    func getRocketData() async
}
