//
//  ItensTableViewCellScreen.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import UIKit

class ItensTableViewCellScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.primarybgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameItemLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryTextColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionItemLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.thirdTextColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.primarybgColor
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(viewBackground)
        viewBackground.addSubview(foodImageView)
        viewBackground.addSubview(nameItemLabel)
        viewBackground.addSubview(descriptionItemLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 92),
            
            foodImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 20),
            foodImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 8),
            foodImageView.widthAnchor.constraint(equalToConstant: 92),
            foodImageView.heightAnchor.constraint(equalToConstant: 102),
            
            nameItemLabel.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 20),
            nameItemLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 28),
            
            descriptionItemLabel.topAnchor.constraint(equalTo: nameItemLabel.bottomAnchor, constant: 2),
            descriptionItemLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 28),
            descriptionItemLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -4),
            
        ])
    }
}
