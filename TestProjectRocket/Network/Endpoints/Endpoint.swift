//
//  Endpoint.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation

enum Endpoint {
    case rockets
    case launches
    
    var path: String {
        switch self {
        case .rockets:
            return "https://api.spacexdata.com/v4/rockets"
        case .launches:
            return "https://api.spacexdata.com/v4/launches"
        }
    }
}
