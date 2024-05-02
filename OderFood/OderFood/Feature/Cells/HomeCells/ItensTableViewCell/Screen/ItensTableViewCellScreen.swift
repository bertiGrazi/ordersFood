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
    
    lazy var nameItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.primaryTextColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
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
        viewBackground.addSubview(nameItemLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 340),
            
            nameItemLabel.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 20),
            nameItemLabel.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 8),
        ])
    }
}
