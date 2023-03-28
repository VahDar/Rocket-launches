// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rocket = try? JSONDecoder().decode(Rocket.self, from: jsonData)

import Foundation

// MARK: - Rocket
struct Rocket: Decodable {
    let height: Diameter
    let diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    let name, type: String
    let active: Bool
    let stages, boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: String
    let description: String
    let id: String

}

extension Rocket {
    struct Diameter: Decodable {
        let meters: Double
        let feet: Double?
    }
    
    // MARK: - Engines
    struct Engines: Decodable {
        let isp: ISP
        let thrustSeaLevel, thrustVacuum: Thrust
        let number: Int
        let type: String
        let version: String
        let layout: String?
        let engineLossMax: Int?
        let propellant1: String
        let propellant2: String
        let thrustToWeight: Double
        
    }
    
    // MARK: - ISP
    struct ISP: Decodable {
        let seaLevel: Int
        let vacuum: Int
        
    }
    
    // MARK: - Thrust
    struct Thrust: Decodable {
        let kN, lbf: Int
    }
    
    // MARK: - FirstStage
    struct FirstStage: Decodable {
        let thrustSeaLevel, thrustVacuum: Thrust
        let reusable: Bool
        let engines: Int
        let fuelAmountTons: Double
        let burnTimeSEC: Int?
        
    }
    
    // MARK: - LandingLegs
    struct LandingLegs: Decodable {
        let number: Int
        let material: String?
    }
    
    // MARK: - Mass
    struct Mass: Codable {
        let kg, lb: Int
    }
    
    // MARK: - PayloadWeight
    struct PayloadWeight: Decodable {
        let id, name: String
        let kg, lb: Int
    }
    
    // MARK: - SecondStage
    struct SecondStage: Decodable {
        let thrust: Thrust
        let payloads: Payloads
        let reusable: Bool
        let engines: Int
        let fuelAmountTons: Double
        let burnTimeSEC: Int?
        
    }
    
    // MARK: - Payloads
    struct Payloads: Decodable {
        let compositeFairing: CompositeFairing
        let option1: String
        
    }
    
    // MARK: - CompositeFairing
    struct CompositeFairing: Decodable {
        let height, diameter: Diameter
    }
}
