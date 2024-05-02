//
//  HomeService.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation

protocol HomeServiceDelegate: GenericService {
    func getCategoriesFromJson(completion: @escaping completion<CategoriesData?>)
}

class HomeService: HomeServiceDelegate {
    func getCategoriesFromJson(completion: @escaping completion<CategoriesData?>) {
        if let url = Bundle.main.url(forResource: "CategoriesData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let categoriesData: CategoriesData = try JSONDecoder().decode(CategoriesData.self, from: data)
                completion(categoriesData, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "CategoriesData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "CategoriesData"))
        }
    }
}
 
