//
//  LaunchViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 13.03.2024.
//

import UIKit
import Swinject

class LaunchViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: LaunchSceneViewModelProtocol!
    var launchCell: LaunchCollectionViewCell!
    var rocketID: String?
    var rocketName: String?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
        viewModel = Container.launch.resolve(LaunchSceneViewModelProtocol.self)
        launchCell = LaunchCollectionViewCell()
        viewModel.rocketID = rocketID
        setupUI()
        constraints()
        collectionViewDelegate()
        fetchData()
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
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        backButton.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
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
    
    //MARK: - Fetch data
    private func fetchData() {
        Task {
            await viewModel.getLaunchData()
            collectionView.reloadData()
        }
    }
}

extension LaunchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalPadding: CGFloat = 60
        let availableWidth = view.frame.width - horizontalPadding
        let height: CGFloat = 100
        
        return CGSize(width: availableWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
}



