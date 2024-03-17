//
//  SettingsStorage.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 17.03.2024.
//

import Foundation

class SettingsStorage {
    
    // Keys for UserDefaults
       private enum UserDefaultsKeys {
           static let heightUnit = "heightUnit"
           static let diameterUnit = "diameterUnit"
           static let massUnit = "massUnit"
           static let payloadUnit = "payloadUnit"
       }

       // Save unit preferences
       static func saveHeightUnit(_ unit: String) {
           UserDefaults.standard.set(unit, forKey: UserDefaultsKeys.heightUnit)
       }

       static func saveDiameterUnit(_ unit: String) {
           UserDefaults.standard.set(unit, forKey: UserDefaultsKeys.diameterUnit)
       }

       static func saveMassUnit(_ unit: String) {
           UserDefaults.standard.set(unit, forKey: UserDefaultsKeys.massUnit)
       }

       static func savePayloadUnit(_ unit: String) {
           UserDefaults.standard.set(unit, forKey: UserDefaultsKeys.payloadUnit)
       }

       // Retrieve unit preferences
       static func getHeightUnit() -> String? {
           return UserDefaults.standard.string(forKey: UserDefaultsKeys.heightUnit)
       }

       static func getDiameterUnit() -> String? {
           return UserDefaults.standard.string(forKey: UserDefaultsKeys.diameterUnit)
       }

       static func getMassUnit() -> String? {
           return UserDefaults.standard.string(forKey: UserDefaultsKeys.massUnit)
       }

       static func getPayloadUnit() -> String? {
           return UserDefaults.standard.string(forKey: UserDefaultsKeys.payloadUnit)
       }
}
