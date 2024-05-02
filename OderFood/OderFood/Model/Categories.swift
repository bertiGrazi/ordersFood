//
//  Categories.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation

// MARK: - CategoriesData
struct CategoriesData: Codable {
    var categories: [Categories]
}

// MARK: - Categories
struct Categories: Codable {
    var name: String?
    var itens: [Itens]
}

// MARK: - Itens
struct Itens: Codable {
    var name: String?
    var image: String?
    var description: String?
    var price: Double
}
