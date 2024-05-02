//
//  ItensTableViewCell.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import UIKit

class ItensTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: ItensTableViewCell.self)
    
    private lazy var screen: ItensTableViewCellScreen = {
        let view = ItensTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    public func setupCell(itens: Itens) {
        screen.nameItemLabel.text = itens.name ?? ""
        screen.descriptionItemLabel.text = itens.description ?? ""
    }
}
