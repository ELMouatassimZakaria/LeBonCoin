//
//  Product.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import Foundation

struct Product: Codable {
    let id, categoryID: Int
    let title, productDescription: String
    let price: Int
    let imagesURL: ImagesURL
    let creationDate: String
    let isUrgent: Bool
    let siret: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case title
        case productDescription = "description"
        case price
        case imagesURL = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
    }
}

// MARK: - ImagesURL
struct ImagesURL: Codable {
    let small, thumb: String?
}

typealias ProductList = [Product]
