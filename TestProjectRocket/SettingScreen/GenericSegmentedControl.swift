//
//  GenericSegmentedControl.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 15.03.2024.
//

import Foundation
import UIKit

class GenericSegmentedControl<T>: UISegmentedControl {
    private var item: [T]
    
    init(items: [T], titleProvider: (T) -> String) {
        self.item = items
        super.init(items: items.map(titleProvider))
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let font = UIFont.systemFont(ofSize: 17.5)
        setTitleTextAttributes([.font: font, .foregroundColor: UIColor.black], for: .selected)
        setTitleTextAttributes([.font: font, .foregroundColor: UIColor.lightGray], for: .normal)
        selectedSegmentIndex = 0
    }
}
