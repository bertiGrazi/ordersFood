//
//  TabBarVC.swift
//  OrdersrFood
//
//  Created by Grazi  Berti on 01/05/24.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let home = UINavigationController(rootViewController: HomeVC())
        let cart = UINavigationController(rootViewController: CartVC())
        
        setViewControllers([home, cart], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.secondaryBgColor
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.primarybgColor
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "cart")
    }
}
