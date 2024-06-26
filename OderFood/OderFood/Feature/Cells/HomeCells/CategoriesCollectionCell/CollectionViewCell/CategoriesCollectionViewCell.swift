//
//  CategoriesCollectionViewCell.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: CategoriesCollectionViewCell.self)
    
    private lazy var screen: CategoriesCollectionViewCellScreen = {
        let view = CategoriesCollectionViewCellScreen()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isSeletect: Bool = true {
        didSet {
            updateBackgroundColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateBackgroundColor() {
        screen.categoryLabel.layer.borderColor = isSeletect ? UIColor.secondaryBgColor.cgColor : UIColor.primarybgColor.cgColor
    }
    
    public func setupCell(categories: Categories) {
        screen.categoryLabel.text = categories.name ?? "Teste da Grazi"
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
 
