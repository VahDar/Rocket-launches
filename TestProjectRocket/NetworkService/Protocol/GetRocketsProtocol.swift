//
//  GetRockets.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation


protocol GetRocketsProtocol {
    func getRockets() async throws -> RocketModel
}
