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

        viewModel = RocketScreenViewModel()
        Task {
            await viewModel.getRocketData()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    // MARK: - Views
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
        return collectionView
    }()

    private func constraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.rocketData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as? RocketCollectionViewCell else {
            return UICollectionViewCell()
        }
    }

}
