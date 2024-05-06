//
//  CartViewController.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 01/05/24.
//

import UIKit

class CartVC: UIViewController {
    
    let headerComponent = HeaderComponent(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.primarybgColor
        addView()
        configConstrains()
        
        headerComponent.titleText = "Seu carrinho"
    }
    
    func addView() {
        view.addSubview(headerComponent)
    }
    
    func configConstrains() {
        NSLayoutConstraint.activate([
                    headerComponent.topAnchor.constraint(equalTo: view.topAnchor),
                    headerComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    headerComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ])
    }
}
