//
//  RocketViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

import UIKit

final class RocketViewController: UIViewController {
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
    private lazy var dataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEverything()
        collectionView.dataSource = dataSource
        //fix delete
        applySnapShot([
            .init(type: .button, item: [.button])
        ])
    }
}

private extension RocketViewController {
    
    func applySnapShot(_ sections: [RocketSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<RocketSection, RocketItem>()
        for section in sections {
            snapshot.appendSections([section])
            snapshot.appendItems(section.item, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func setupEverything() {
        collectionView.register(RocketButtonCollectionViewCell.self, forCellWithReuseIdentifier: RocketButtonCollectionViewCell.identifier)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        .init { section, _ in
            let section = RocketSectionType.button
            switch section {
            case .button:
                let size: NSCollectionLayoutSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(100))
                let item: NSCollectionLayoutItem = .init(layoutSize: size)
                let groupSize: NSCollectionLayoutSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(100))
                let group: NSCollectionLayoutGroup = .horizontal(layoutSize: groupSize, subitems: [item])
                var section: NSCollectionLayoutSection = .init(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            default:
                fatalError("Error")
            }
                
            
        }
    }
    func makeDataSource() -> UICollectionViewDiffableDataSource<RocketSection, RocketItem> {
        .init(collectionView: collectionView) {
            collectionView, indexPath, item in
            switch item {
            case let .header(image, title):
                fatalError("Error")
            case let .info(title, value, _):
                fatalError("Error")
            case .button:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketButtonCollectionViewCell.identifier, for: indexPath) as? RocketButtonCollectionViewCell
                (cell as? RocketButtonCollectionViewCell)?.onOpenLaunches = {
                    print("test")
                }
                return cell
            }
        }
    }
}
