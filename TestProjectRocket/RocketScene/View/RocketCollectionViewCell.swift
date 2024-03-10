//
//  RocketCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import Foundation
import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    // MARK - Properties
    static let identifier = "CollectionViewCell"
    var viewMode: RocketScreenViewModelProtocol!
    
    // MARK - Views
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let diameterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let massLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 10
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayouts() {
        [heightLabel, diameterLabel, massLabel, payloadLabel].forEach(contentView.addSubview)
        
        
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalToConstant: 150),
            contentView.widthAnchor.constraint(equalToConstant: 150),
            
            heightLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            heightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            heightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            diameterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            diameterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            diameterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            diameterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            massLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            massLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            massLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            massLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            payloadLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            payloadLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            payloadLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            payloadLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    func configure(with rocket: RocketModel) {
        heightLabel.text = "\(rocket.height.meters.map { "\($0) м" } ?? "N/A")"
        diameterLabel.text = "\(rocket.diameter.meters.map { "\($0) м" } ?? "N/A")"
//            massLabel.text = "Масса: \(rocket.mass. { "\($0) кг" } ?? "N/A")"
//        
        if let payloadLEO = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
               payloadLabel.text = "Полезная нагрузка (LEO): \(payloadLEO.kg) kg"
           } else {
               payloadLabel.text = "Полезная нагрузка (LEO): N/A"
           }
        
    }
}
