//
//  SettingViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 15.03.2024.
//

import UIKit

protocol SettingsDelegate: AnyObject {
    func didChangeHeightUnit(to unit: String)
    func didChangeDiameterUnit(to unit: String)
    func didChangeMassUnit(to unit: String)
    func didChangePayloadUnit(to unit: String)
}

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    private let lengthUnits = ["m", "ft"]
    private let weightUnits = ["kg", "lb"]
    weak var delegate: SettingsDelegate?
    
    // MARKL - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        restoreSettings()
        setupUI()
    }
    
    // MARK: - View
    private lazy var heightLabel = createLabel(text: "Height")
    private lazy var diametrLabel = createLabel(text: "Diametr")
    private lazy var weightLabel = createLabel(text: "Weight")
    private lazy var usefulLoadLabel = createLabel(text: "Useful load")
    private lazy var titleLabel = createLabel(text: "Settings")
    
    private lazy var heightSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(heightSegmentControlChanged))
    
    @objc func heightSegmentControlChanged(_ sender: UISegmentedControl) {
        let unit = lengthUnits[sender.selectedSegmentIndex]
        delegate?.didChangeHeightUnit(to: unit)
        SettingsStorage.saveHeightUnit(unit)
    }
    
    private lazy var diamentrSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(diamentrSegmentControlChanged))
    
    @objc func diamentrSegmentControlChanged(_ sender: UISegmentedControl) {
        let unit = lengthUnits[sender.selectedSegmentIndex]
        delegate?.didChangeDiameterUnit(to: unit)
        SettingsStorage.saveDiameterUnit(unit)
    }
    
    private lazy var weightSegmentalControl = createSegmentedControl(items: weightUnits, action: #selector(weightSegmentControlChanged))
    
    @objc func weightSegmentControlChanged(_ sender: UISegmentedControl) {
        let unit = weightUnits[sender.selectedSegmentIndex]
        delegate?.didChangeMassUnit(to: unit)
        SettingsStorage.saveMassUnit(unit)
    }
    
    private lazy var usefulLoadSegmentalControl = createSegmentedControl(items: weightUnits, action: #selector(usefulLoadSegmentControlChanged))
    
    @objc func usefulLoadSegmentControlChanged(_ sender: UISegmentedControl) {
        let unit = weightUnits[sender.selectedSegmentIndex]
        delegate?.didChangePayloadUnit(to: unit)
        SettingsStorage.savePayloadUnit(unit)
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Setting storage
    private func restoreSettings() {
        if let heightUnit = SettingsStorage.getHeightUnit(), let index = lengthUnits.firstIndex(of: heightUnit) {
            heightSegmentalControl.selectedSegmentIndex = index
        }
        
        if let diameterUnit = SettingsStorage.getDiameterUnit(), let index =
            lengthUnits.firstIndex(of: diameterUnit) {
            diamentrSegmentalControl.selectedSegmentIndex = index
        }
        
        if let massUnit = SettingsStorage.getMassUnit(), let index =
            weightUnits.firstIndex(of: massUnit) {
            weightSegmentalControl.selectedSegmentIndex = index
        }
        
        if let payLoadUnit = SettingsStorage.getPayloadUnit(), let index =
            weightUnits.firstIndex(of: payLoadUnit) {
            usefulLoadSegmentalControl.selectedSegmentIndex = index
        }
    }
    
    //MARK: - SetupUI and constraints
    private func setupUI() {
        view.backgroundColor = .black
    }
    
    private func constraints() {
        
        [heightSegmentalControl, diamentrSegmentalControl, weightSegmentalControl, usefulLoadSegmentalControl, heightLabel, weightLabel, diametrLabel, usefulLoadLabel, backButton, titleLabel].forEach(view.addSubview)
        let segmentalTrailingAnchor = [heightSegmentalControl, diamentrSegmentalControl, weightSegmentalControl, usefulLoadSegmentalControl]
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-40)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
        segmentalTrailingAnchor.forEach { label in
            label.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-40)
                make.width.equalTo(100)
            }
        }
        heightSegmentalControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
        }
        heightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(heightSegmentalControl.snp.centerY)
            make.leading.equalToSuperview().offset(40)
        }
        diamentrSegmentalControl.snp.makeConstraints { make in
            make.top.equalTo(heightSegmentalControl.snp.bottom).offset(20)
        }
        diametrLabel.snp.makeConstraints { make in
            make.centerY.equalTo(diamentrSegmentalControl.snp.centerY)
            make.leading.equalToSuperview().offset(40)
        }
        weightSegmentalControl.snp.makeConstraints { make in
            make.top.equalTo(diamentrSegmentalControl.snp.bottom).offset(20)
        }
        weightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(weightSegmentalControl.snp.centerY)
            make.leading.equalToSuperview().offset(40)
        }
        usefulLoadSegmentalControl.snp.makeConstraints { make in
            make.top.equalTo(weightSegmentalControl.snp.bottom).offset(20)
        }
        usefulLoadLabel.snp.makeConstraints { make in
            make.centerY.equalTo(usefulLoadSegmentalControl.snp.centerY)
            make.leading.equalToSuperview().offset(40)
        }
    }
}

extension UIViewController {
    func createSegmentedControl(items: [String], action: Selector) -> UISegmentedControl {
        let font = UIFont.systemFont(ofSize: 14)
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.lightGray], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: action, for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }
}
