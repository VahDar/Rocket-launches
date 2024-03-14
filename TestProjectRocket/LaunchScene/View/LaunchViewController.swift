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
    var rocketID: String?
    var rocketName: String?
    
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
        viewModel.rocketID = rocketID
        setupUI()
        constraints()
        collectionViewDelegate()
                Task {
            await viewModel.getLaunchData()
                collectionView.reloadData()
        }
    }
    
    //MARK: - CollectionView Delegate
    private func collectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - SetupUI and Constraints
    private func setupUI() {
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
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

extension LaunchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.launchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.identifier, for: indexPath) as? LaunchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let launchModel = viewModel.launchData[indexPath.item]
        cell.confugire(with: launchModel)
        
        return cell
    }
    
    
}