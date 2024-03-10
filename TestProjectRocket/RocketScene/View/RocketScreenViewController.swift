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
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
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
//        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 10, height: 10))
//        
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
        return view
    }()
    
    private func constraints() {
        
        view.addSubview(rocketImageView)
        view.addSubview(contentView)
        contentView.addSubview(rocketNameLabel)
        contentView.addSubview(rocketCell)
        
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: view.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 320),
            
            contentView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -25),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
        
        if let currentRocket = viewModel.currentRocker, !currentRocket.flickrImages.isEmpty, let urlString = currentRocket.flickrImages.first, let url = URL(string: urlString) {
            rocketCell.configure(with: currentRocket)
            rocketImageView.sd_setImage(with: url)
            rocketNameLabel.text = currentRocket.name
        }
    }
    
}


