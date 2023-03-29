//
//  Reusable.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 29.03.2023.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        String(describing: Self.self)
    }
}


extension UITableViewCell: Reusable {
}

extension UICollectionViewCell: Reusable {
    
}
