//
//  SettingViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 15.03.2024.
//

import UIKit

class SettingViewController: UIViewController {

    // MARK: - Properties
    private let lengthUnits = ["m", "ft"]
    private let weightUnits = ["kg", "lb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - View
    lazy var heightLabel = createLabel(text: "Height")
    lazy var diametrLabel = createLabel(text: "Diametr")
    lazy var weightLabel = createLabel(text: "Weight")
    lazy var usefulLoadLabel = createLabel(text: "Useful load")
    
    lazy var heightSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(heightSegmentControlChanged))
    
    @objc func heightSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    lazy var diamentrSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(diamentrSegmentControlChanged))

    @objc func diamentrSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    lazy var weightSegmentalControl = createSegmentedControl(items: weightUnits, action: #selector(weightSegmentControlChanged))
    
    @objc func weightSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    lazy var usefulLoadSegmentalControl = createSegmentedControl(items: weightUnits, action: #selector(usefulLoadSegmentControlChanged))
    
    @objc func usefulLoadSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    func constraints() {
        view.backgroundColor = .black
        [heightSegmentalControl, diamentrSegmentalControl, weightSegmentalControl, usefulLoadSegmentalControl, heightLabel, weightLabel, diametrLabel, usefulLoadLabel].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            heightSegmentalControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            heightSegmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            heightSegmentalControl.widthAnchor.constraint(equalToConstant: 100),
            heightLabel.centerYAnchor.constraint(equalTo: heightSegmentalControl.centerYAnchor),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            diamentrSegmentalControl.topAnchor.constraint(equalTo: heightSegmentalControl.bottomAnchor, constant: 20),
            diamentrSegmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            diamentrSegmentalControl.widthAnchor.constraint(equalToConstant: 100),
            diametrLabel.centerYAnchor.constraint(equalTo: diamentrSegmentalControl.centerYAnchor),
            diametrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            weightSegmentalControl.topAnchor.constraint(equalTo: diamentrSegmentalControl.bottomAnchor, constant: 20),
            weightSegmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            weightSegmentalControl.widthAnchor.constraint(equalToConstant: 100),
            weightLabel.centerYAnchor.constraint(equalTo: weightSegmentalControl.centerYAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            usefulLoadSegmentalControl.topAnchor.constraint(equalTo: weightSegmentalControl.bottomAnchor, constant: 20),
            usefulLoadSegmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usefulLoadSegmentalControl.widthAnchor.constraint(equalToConstant: 100),
            usefulLoadLabel.centerYAnchor.constraint(equalTo: usefulLoadSegmentalControl.centerYAnchor),
            usefulLoadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
    }

}

extension UIViewController {
    func createSegmentedControl(items: [String], action: Selector) -> UISegmentedControl {
        let font = UIFont.systemFont(ofSize: 14)
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.lightGray], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: action, for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }
}
