//
//  RocketScreenViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit

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
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
//        return collectionView
//    }()
    
    private let rocketImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
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
    
    
    private func constraints() {
        
        view.addSubview(rocketCell)
        
        
        NSLayoutConstraint.activate([
            rocketCell.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            rocketCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rocketCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rocketCell.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rocketCell.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        rocketCell.translatesAutoresizingMaskIntoConstraints = false
        
        if let currentRocker = viewModel.currentRocker {
            rocketCell.configure(with: currentRocker)
            rocketNameLabel.text = currentRocker.name
        }
    }
    
}


