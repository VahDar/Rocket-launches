//
//  InjectionKey.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 05.03.2024.
//

import Foundation

protocol InjectionKey {
    
    associatedtype Value
    
    static var currentValue: Self.Value { get set }
}
