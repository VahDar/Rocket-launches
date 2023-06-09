//
//  SettingsRepository.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

import Foundation

protocol SettingsRepository {
    func save(_ settings: [Setting])
    func get() -> [Setting]
}

final class SettingsRepositoryNetwor: SettingsRepository {
    
    private enum Key {
        static let settings = "settings"
    }
    
    private let userDefaults: UserDefaults
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    init(userDefaults: UserDefaults = .standard,
         jsonDecoder: JSONDecoder = .init(),
         jsonEncoder: JSONEncoder = .init()) {
        self.userDefaults = userDefaults
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }
    
    func save(_ settings: [Setting]) {
        guard let data = try? jsonEncoder.encode(settings) else {
            return
        }
        userDefaults.set(data, forKey: Key.settings)
    }
    
    func get() -> [Setting] {
       guard let data = userDefaults.data(forKey: Key.settings),
             let settings = try? jsonDecoder.decode([Setting].self, from: data) else {
                 return[]
             }
        return settings
    }
}
