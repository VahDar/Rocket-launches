//
//  RocketCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import Foundation
import UIKit

class RocketViewCell: UIView {
    
    
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
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diameterView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let massView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let payloadView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
       
        self.addSubview(contentView)
        contentView.addSubview(stack)
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
            
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
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
    
    func configure(with rocket: RocketModel) {
        heightLabel.text = "\(rocket.height.feet.map { "\($0)" } ?? "N/A")"
        diameterLabel.text = "\(rocket.diameter.feet.map { "\($0)" } ?? "N/A")"
        massLabel.text = "\(rocket.mass.lb)"
        
        if let payloadLEO = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
               payloadLabel.text = "Полезная нагрузка (LEO): \(payloadLEO.kg) kg"
           } else {
               payloadLabel.text = "Полезная нагрузка (LEO): N/A"
           }
    }
}
