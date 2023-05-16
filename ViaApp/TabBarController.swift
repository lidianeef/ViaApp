//
//  TabBarController.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.
//
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        
        let productsViewController = ProductsViewController()
        let vc2 = UINavigationController(rootViewController: productsViewController)

        let vc3 = UINavigationController(rootViewController: CartViewController())
        let vc4 = UINavigationController(rootViewController: AccountViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc3.tabBarItem.image = UIImage(systemName: "cart")
        vc4.tabBarItem.image = UIImage(systemName: "person")
                
        vc1.title = "Início"
        vc2.title = "Produtos"
        vc3.title = "Carrinho"
        vc4.title = "Conta"
        
        tabBar.backgroundColor = .systemBackground
        tabBar.barTintColor = .systemGray6
        tabBar.isTranslucent = false
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
 
