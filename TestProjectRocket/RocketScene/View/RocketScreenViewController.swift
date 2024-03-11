//
//  RocketScreenViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit
import SDWebImage

class RocketScreenViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: RocketScreenViewModelProtocol!
    var rocketCell: RocketViewCell!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        rocketCell = RocketViewCell()
        
        viewModel = RocketScreenViewModel()
        constraints()
        Task {
            await viewModel.getRocketData()
            setupUI()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Создаем путь с закругленными верхними углами
        let path = UIBezierPath(roundedRect: contentView.bounds,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 30.0, height: 30.0))

        // Создаем маску для пути
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath

        // Присваиваем маску слою contentView
        contentView.layer.mask = maskLayer
    }
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let rocketImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "First launch"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Country"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Launch cost"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "FIRST STAGE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfEnginesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Number of engines"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountOfFuelinTonsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Amount of fuel in tons"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let burnTimeInSecondsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Burn time in sec"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func constraints() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(contentView)
        [
        rocketNameLabel, rocketCell, firstLaunchLabel, countryLabel, costLabel, firstStageLabel, numberOfEnginesLabel, amountOfFuelinTonsLabel, burnTimeInSecondsLabel
        ].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 320),
            rocketImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -55),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            rocketCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            rocketCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rocketCell.heightAnchor.constraint(equalToConstant: 120),
            
            firstLaunchLabel.topAnchor.constraint(equalTo: rocketCell.bottomAnchor, constant: 25),
            firstLaunchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            countryLabel.topAnchor.constraint(equalTo: firstLaunchLabel.bottomAnchor, constant: 25),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            costLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 25),
            costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            firstStageLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 50),
            firstStageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),

            numberOfEnginesLabel.topAnchor.constraint(equalTo: firstStageLabel.bottomAnchor, constant: 25),
            numberOfEnginesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            amountOfFuelinTonsLabel.topAnchor.constraint(equalTo: numberOfEnginesLabel.bottomAnchor, constant: 25),
            amountOfFuelinTonsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            burnTimeInSecondsLabel.topAnchor.constraint(equalTo: amountOfFuelinTonsLabel.bottomAnchor, constant: 25),
            burnTimeInSecondsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        rocketCell.translatesAutoresizingMaskIntoConstraints = false
        
        if let currentRocket = viewModel.rocketData.first {
            rocketCell.configure(with: currentRocket)
            rocketNameLabel.text = currentRocket.name
            
            if !currentRocket.flickrImages.isEmpty {
                let randomIndex = Int(arc4random_uniform(UInt32(currentRocket.flickrImages.count)))
                let urlString = currentRocket.flickrImages[randomIndex]
            if let url = URL(string: urlString) {
                rocketImageView.sd_setImage(with: url)
                }
            }
        }
    }
    
}


