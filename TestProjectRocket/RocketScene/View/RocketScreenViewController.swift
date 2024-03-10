//
//  RocketScreenViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit

class RocketScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Properties
    var viewModel: RocketScreenViewModelProtocol!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        viewModel = RocketScreenViewModel()
        Task {
            await viewModel.getRocketData()
            setupUI()
            collectionView.reloadData()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    // MARK: - Views
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
        return collectionView
    }()
    
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
        
        view.addSubview(collectionView)
        view.addSubview(rocketImageView)
        view.addSubview(rocketNameLabel)
        
        NSLayoutConstraint.activate([
            rocketNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            rocketNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        if let currentRocker = viewModel.currentRocker {
            rocketNameLabel.text = currentRocker.name
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.rocketData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as? RocketCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let rocket = viewModel.currentRocker {
            cell.configure(with: rocket)
            
        }
        return cell
    }

}


