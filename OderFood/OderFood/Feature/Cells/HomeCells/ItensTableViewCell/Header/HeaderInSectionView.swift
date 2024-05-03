//
//  HeaderInSectionView.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 03/05/24.
//

import UIKit

class HeaderInSectionView: UIView {
    
    lazy var headerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configConstrains()
    }
    
    func addView() {
        addSubview(headerNameLabel)
    }
    
    func configConstrains() {
        NSLayoutConstraint.activate([
            headerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headerNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    public func setupHeader(with header: String) {
        headerNameLabel.text = header
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
