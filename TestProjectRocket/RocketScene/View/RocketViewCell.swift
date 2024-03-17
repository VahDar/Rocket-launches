//
//  RocketCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import Foundation
import UIKit

class RocketViewCell: UIView {
    
    let settingsViewController = SettingsViewController()
    var currentHeightUnit: String
    var currentDiameterUnit: String
    var currentMassUnit: String
    var currentPayloadUnit: String
    var rocket: RocketModel?
        
    // MARK - Views
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let diameterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let massLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let payloadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diameterView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let massView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let payloadView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        self.currentHeightUnit = SettingsStorage.getHeightUnit() ?? "ft"
        self.currentDiameterUnit = SettingsStorage.getDiameterUnit() ?? "ft"
        self.currentMassUnit = SettingsStorage.getMassUnit() ?? "lb"
        self.currentPayloadUnit = SettingsStorage.getPayloadUnit() ?? "kg"
        
        super.init(frame: frame)
        setupLayouts()
        settingsViewController.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setupLayouts() {
       
        self.addSubview(contentView)
        contentView.addSubview(scrollView)
        scrollView.addSubview(stack)
        stack.addArrangedSubview(heightView)
        stack.addArrangedSubview(diameterView)
        stack.addArrangedSubview(massView)
        stack.addArrangedSubview(payloadView)
        heightView.addSubview(heightLabel)
        diameterView.addSubview(diameterLabel)
        massView.addSubview(massLabel)
        payloadView.addSubview(payloadLabel)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 35),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            heightView.heightAnchor.constraint(equalToConstant: 100),
            heightView.widthAnchor.constraint(equalToConstant: 100),
            diameterView.heightAnchor.constraint(equalToConstant: 100),
            diameterView.widthAnchor.constraint(equalToConstant: 100),
            massView.heightAnchor.constraint(equalToConstant: 100),
            massView.widthAnchor.constraint(equalToConstant: 100),
            payloadView.heightAnchor.constraint(equalToConstant: 100),
            payloadView.widthAnchor.constraint(equalToConstant: 100),
            
            heightLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor),
            heightLabel.centerYAnchor.constraint(equalTo: heightView.centerYAnchor),
            
            diameterLabel.centerXAnchor.constraint(equalTo: diameterView.centerXAnchor),
            diameterLabel.centerYAnchor.constraint(equalTo: diameterView.centerYAnchor),
            
            massLabel.centerXAnchor.constraint(equalTo: massView.centerXAnchor),
            massLabel.centerYAnchor.constraint(equalTo: massView.centerYAnchor),
            
            payloadLabel.centerXAnchor.constraint(equalTo: payloadView.centerXAnchor),
            payloadLabel.centerYAnchor.constraint(equalTo: payloadView.centerYAnchor),
            
        ])
    }
    
    // MARK: - Configure
    func configure(with rocket: RocketModel) {
        self.rocket = rocket
        heightLabel.text = currentHeightUnit == "ft" ? "\(rocket.height.feet.map { "\($0)" } ?? "N/A")" : "\(rocket.height.meters.map { "\($0)" } ?? "N/A")"
        diameterLabel.text = currentDiameterUnit == "ft" ? "\(rocket.diameter.feet.map { "\($0)" } ?? "N/A")" : "\(rocket.diameter.meters.map { "\($0)" } ?? "N/A")"
        massLabel.text = currentMassUnit == "lb" ? "\(rocket.mass.lb)" : "\(rocket.mass.kg)"
        
        if let payloadLEO = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
            payloadLabel.text = currentPayloadUnit == "lb" ? "\(payloadLEO.lb)" : "\(payloadLEO.kg)"
           } else {
               payloadLabel.text = "N/A"
           }
    }
}

extension RocketViewCell: SettingsDelegate {
    func didChangeHeightUnit(to unit: String) {
        currentHeightUnit = unit
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangeDiameterUnit(to unit: String) {
        currentDiameterUnit = unit
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangeMassUnit(to unit: String) {
        currentMassUnit = unit
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangePayloadUnit(to unit: String) {
        currentPayloadUnit = unit
        if let rocket = rocket {
            configure(with: rocket)
        }
    }
}
