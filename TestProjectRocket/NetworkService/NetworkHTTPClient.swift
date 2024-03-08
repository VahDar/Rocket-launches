//
//  NetworkHTTPClient.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation

protocol NetworkHTTPClient {
    func fetchData<T: Decodable>(from endpoint: String, requestMethod: RequestMethod, responseType: T.Type) async throws -> T
}

extension NetworkHTTPClient {
    
    func fetchData<T: Decodable>(from endpoint: String, requestMethod: RequestMethod, responseType: T.Type) async throws -> T {
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.requestFailed
            }
            do {
                let decoderData = try JSONDecoder().decode(T.self, from: data)
                return decoderData
            } catch {
                throw NetworkError.jsonParsingFailed
            }
        } catch {
            throw NetworkError.invalidData
        }
    }
}
