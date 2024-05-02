//
//  CategoriesCollectionViewCellScreen.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import UIKit

class CategoriesCollectionViewCellScreen: UIView {
    
    lazy var categoryLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.primarybgColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = UIColor.primarybgColor.withAlphaComponent(0.5)
        label.clipsToBounds = true
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    func addViews() {
        addSubview(categoryLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
