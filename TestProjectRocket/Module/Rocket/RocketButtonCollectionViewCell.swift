//
//  RocketButtonCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 29.03.2023.
//

import UIKit

final class RocketButtonCollectionViewCell: UICollectionViewCell {
    
    private let openLaunchButton = UIButton()
    var onOpenLaunches: (() -> Void)?
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        setupScreen()
        openLaunchButton.addTarget(self, action: #selector(openLaunches), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RocketButtonCollectionViewCell {
    
    
    @objc func openLaunches() {
        onOpenLaunches?()
    }
    
    func setupScreen() {
        contentView.addSubview(openLaunchButton)
        openLaunchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openLaunchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            openLaunchButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            openLaunchButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            openLaunchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
