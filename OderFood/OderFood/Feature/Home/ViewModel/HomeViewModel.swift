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
    
    var categoriesData: CategoriesData?
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
    
    // MARK: - ItensTableView
    
    public func numberOfSections() -> Int {
        guard let categories = categoriesData?.categoriesList else {
            return 0
        }
        return categories.count
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        guard let categoryId = categoriesData?.categoriesList?[section].id else {
            return 0
        }
        return numberOfItemsInCategory(categoryId: categoryId)
    }
    
    public func loadItensInSection(section: Int, row: Int) -> Itens? {
        guard let categoryId = categoriesData?.categoriesList?[section].id else {
            return nil
        }
        return loadItensInCategory(categoryId: categoryId)[row]
    }
    
    private func numberOfItemsInCategory(categoryId: Int) -> Int {
        return loadItensInCategory(categoryId: categoryId).count
    }
    
    private func loadItensInCategory(categoryId: Int) -> [Itens] {
        guard let itens = categoriesData?.itensList else {
            return []
        }
        return itens.filter { $0.id == categoryId }
    }
    
    public var heightForRowAt: CGFloat {
        return 110
    }
    
    
    // MARK: - CategoriesCollectionView
    public var numberOfRowsCategoriesInSection: Int {
        return categoriesData?.categoriesList?.count ?? 0
    }
    
    public func loadCategoriesIndexPath(indexPath: IndexPath) -> Categories {
        return categoriesData?.categoriesList?[indexPath.row] ?? Categories()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 108, height: 34)
    }
}
