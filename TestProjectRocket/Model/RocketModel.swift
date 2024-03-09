//
//  RocketModel.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 07.03.2024.
//

import Foundation

// MARK: - LaunchElement
struct RocketModel: Codable {
    let height: Diameter
    let diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: String
    let description: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
            case height, diameter, mass
            case firstStage = "first_stage"
            case secondStage
            case engines
            case landingLegs
            case payloadWeights
            case flickrImages
            case name, type, active, stages, boosters
            case costPerLaunch
            case successRatePct
            case firstFlight
            case country, company, wikipedia, description, id
        }
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    let isp: ISP
    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust
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
struct ISP: Codable {
    let seaLevel: Int
    let vacuum: Int
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN, lbf: Int
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let thrustSeaLevel, thrustVacuum: Thrust
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    let number: Int
    let material: String?
}

// MARK: - Mass
struct Mass: Codable {
    let kg, lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id, name: String
    let kg, lb: Int
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust
    let payloads: Payloads
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?
}

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing
    let option1: String
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height, diameter: Diameter
}

