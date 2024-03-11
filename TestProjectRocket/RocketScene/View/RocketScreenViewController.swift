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
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "First Launch"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Country"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Launch Cost"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "First Stage"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func constraints() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(contentView)
        contentView.addSubview(rocketNameLabel)
        contentView.addSubview(rocketCell)
        
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
            
            contentView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -25),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            rocketCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            rocketCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rocketCell.heightAnchor.constraint(equalToConstant: 150),
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


