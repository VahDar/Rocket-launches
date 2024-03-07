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
