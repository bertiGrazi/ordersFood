//
//  HomeViewModel.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation

class HomeViewModel {
    private let service: HomeService = HomeService()
    private var categoriesData: CategoriesData?
    
    public func fetchRequest(_ typeFeat: TypeFetch) {
        switch typeFeat {
        case .mock:
            service.getCategoriesFromJson { result, failure in
                if let result {
                    self.categoriesData = result
                } else {
                    print(failure as Any)
                }
            }
        }
    }
}
