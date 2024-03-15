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
    
    lazy var weightSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(weightSegmentControlChanged))
    
    @objc func weightSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    lazy var usefulLoadSegmentalControl = createSegmentedControl(items: lengthUnits, action: #selector(usefulLoadSegmentControlChanged))
    
    @objc func usefulLoadSegmentControlChanged(_ sender: UISegmentedControl) {
            // Здесь вы можете обрабатывать изменение выбранного сегмента
            print("Выбран сегмент \(sender.selectedSegmentIndex)")
        }
    
    func constraints() {
        view.backgroundColor = .black
        [heightSegmentalControl, diamentrSegmentalControl, weightSegmentalControl, usefulLoadSegmentalControl].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            heightSegmentalControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            heightSegmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }

}

extension UIViewController {
    func createSegmentedControl(items: [String], action: Selector) -> UISegmentedControl {
        let font = UIFont.systemFont(ofSize: 17.5)
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.lightGray], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: action, for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }
}
