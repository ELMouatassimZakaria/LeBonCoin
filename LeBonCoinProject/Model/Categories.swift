//
//  Categories.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import Foundation

// MARK: - WelcomeElement
struct Categories: Codable {
    let id: Int
    let name: String
}


typealias CategoryList = [Categories]
