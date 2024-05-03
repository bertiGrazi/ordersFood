//
//  CategoriesData.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation

// MARK: - CategoriesData
struct CategoriesData: Codable {
    var categoriesList: [Categories]?
    var itensList: [Itens]?
}

// MARK: - Categories
struct Categories: Codable {
    var name: String?
    var id: Int?
}

// MARK: - Itens
struct Itens: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var description: String?
    var price: Double?
}
