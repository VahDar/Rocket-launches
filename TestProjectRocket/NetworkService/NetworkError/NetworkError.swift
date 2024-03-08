//
//  NetworkError.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case jsonParsingFailed
    case networkServiceUnvailable
}
