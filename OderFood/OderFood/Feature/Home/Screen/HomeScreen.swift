//
//  HomeScreen.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 02/05/24.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.primarybgColor
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Faça seu pedido"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryTextColor.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.secondaryBgColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()
    
    func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configConstrains()
    }
    
    func addView() {
        addSubview(viewBackground)
        viewBackground.addSubview(logoImageView)
        viewBackground.addSubview(titleLabel)
        viewBackground.addSubview(dividerView)
        viewBackground.addSubview(collectionView)
    }
    
    func configConstrains() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: 160),
            
            logoImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 124),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            collectionView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
