//
//  SettingPresenter.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 29.03.2023.
//

import Foundation

protocol SettingsPresenter{
    var present: (([Setting]) -> Void)? {get set}
    
    func change(seting: Setting)
    
}
final class SettingsPresenterImpl: SettingsPresenter {
    private let settingsRepository: SettingsRepository
    
    var present: (([Setting]) -> Void)?
    
    init(settingsRepository: SettingsRepository) {
        self.settingsRepository = settingsRepository
        setup()
    }
    
    func change(seting: Setting) {
        var currentSettings = settingsRepository.get()
        guard let changedIndex = currentSettings.firstIndex(where: {$0.type == seting.type }) else {
            return
        }
        currentSettings.remove(at: changedIndex)
        currentSettings.insert(seting, at: changedIndex)
        settingsRepository.save(currentSettings)
    }
}


private extension SettingsPresenterImpl {
    func setup() {
        let settings = settingsRepository.get()
        present?(settings)
    }
}
