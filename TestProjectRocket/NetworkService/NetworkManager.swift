//
//  NetworkManager.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import Foundation

final class NetworkManager: GetRocketsProtocol, NetworkHTTPClient {
    
    func getRockets() async throws -> RocketModel {
        do {
            return try await fetchData(from: Endpoint.rockets.path, requestMethod: RequestMethod.get, responseType: RocketModel.self)
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            throw error
        }
    }
    
    
}
