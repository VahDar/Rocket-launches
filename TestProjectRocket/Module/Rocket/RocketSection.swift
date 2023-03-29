//
//  RocketSection.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 29.03.2023.
//

import Foundation

enum RocketSectionType: Hashable {
    case header
    case horizontal
    case info(title: String?)
    case button
}

enum RocketItem: Hashable {
    case header(image: URL, title: String)
    case info(title: String, value: String, uuid: UUID = UUID())
    case button
}

struct RocketSection: Hashable {
    let type: RocketSectionType
    let item: [RocketItem]
}
