//
//  ViewController.swift
//  OderFood
//
//  Created by Grazi  Berti on 01/05/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen = HomeScreen()
    var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.primarybgColor
        viewModel.fetchRequest(.request)
    }
}

//MARK: - HomeViewModelDelegate
extension HomeVC: HomeViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.screen.configCollectionViewProtocols(delegate: self, dataSource: self)
        }
    }
    
    func error() {
        print(#function)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell
        cell?.setupCell(categories: viewModel.loadCategoriesIndexPath(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
}
