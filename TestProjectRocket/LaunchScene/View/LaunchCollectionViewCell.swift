//
//  LaunchCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 13.03.2024.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "LaunchCollectionView"
    
    // MARK: - View
    
       let nameRocketLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLaunchLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16,
                                 weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLaunchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ok")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI and Constraints
    private func setupUI() {
        contentView.backgroundColor = UIColor(red: 33/255,
                                              green: 33/255,
                                              blue: 33/255,
                                              alpha: 1)
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
    }
    
    private func constraints() {
        [nameRocketLabel, dateLaunchLabel, statusLaunchImageView].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            nameRocketLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameRocketLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            dateLaunchLabel.topAnchor.constraint(equalTo: nameRocketLabel.bottomAnchor, constant: 7),
            dateLaunchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            statusLaunchImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            statusLaunchImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            statusLaunchImageView.heightAnchor.constraint(equalToConstant: 60),
            statusLaunchImageView.widthAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    func confugire(with launch: LaunchModel) {
        nameRocketLabel.text = launch.name
        dateLaunchLabel.text = launch.date
        
        if let success = launch.success {
            statusLaunchImageView.image = UIImage(named: success ? "ok" : "fail")
        } else {
            statusLaunchImageView.image = UIImage(named: "fail")
        }
    }
}
