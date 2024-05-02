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
        viewModel.fetchRequest(.mock)
    }
}

