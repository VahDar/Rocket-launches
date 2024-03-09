//
//  GetRockets.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation


protocol NetworkManagerProtocol {
    func getRockets() async throws -> [RocketModel]
}
