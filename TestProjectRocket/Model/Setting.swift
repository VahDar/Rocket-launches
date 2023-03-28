//
//  Setting.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

enum RocketMetrics {
    case meter
    case feet
    case kilagram
    case lb
    
    var name: String {
        switch self {
        case .feet:
            return "ft"
        case .meter:
            return "m"
        case .kilagram:
            return "kg"
        case .lb:
            return "lb"
        }
    }
}



enum SettingType: Codable {
    case height
    case diameter
    case weight
    case payload
    
    var name: String {
        switch self {
        case .height:
            return "Height"
        case .diameter:
            return "Diameter"
        case .weight:
            return "Weight"
        case .payload:
            return "Payload"
        }
    }
    
    var rocketMetrics: [RocketMetrics] {
        switch self {
        case .height, .diameter:
            return [.meter, .feet]
        case .weight, .payload:
            return [.kilagram, .lb]
        }
    }
}

struct Setting: Codable {
    let type: SettingType
    let selectedMetrics: Double
}
