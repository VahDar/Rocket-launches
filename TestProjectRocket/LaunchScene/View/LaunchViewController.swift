//
//  LaunchViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 13.03.2024.
//

import UIKit

class LaunchViewController: UIViewController {

    //MARK: - Properties
    var viewModel: LaunchSceneViewModelProtocol!
    var launchCell: LaunchCollectionViewCell!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 100)
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(LaunchCollectionViewCell.self, forCellWithReuseIdentifier: LaunchCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LaunchSceneViewModel()
        launchCell = LaunchCollectionViewCell()
    }
    
    //MARK: - CollectionView Delegate
    private func collectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - SetupUI and Constraints
    private func setupUI() {
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .black
        title = "\(launchCell.nameRocketLabel)"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func constraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension
