//
//  HomeViewModel.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    private let service: HomeService = HomeService()
    private var categoriesData: CategoriesData?
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate:HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFeat: TypeFetch) {
        switch typeFeat {
        case .mock:
            service.getCategoriesFromJson { result, failure in
                if let result {
                    self.categoriesData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
            
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.categoriesData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
    // MARK: - CategoriesCollectionView
    public var numberOfItemsInSection: Int {
        return categoriesData?.categoriesList?.count ?? 0
    }
    
    public func loadCategoriesIndexPath(indexPath: IndexPath) -> Categories {
        return categoriesData?.categoriesList?[indexPath.row] ?? Categories(name: nil, itens: nil)
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 50, height: 34)
    }
}
