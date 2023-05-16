//
//  ProductsCoordinator.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 14/05/23.
//

//import UIKit
//
//final class ProductsCoordinator {
//    private let navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    

//    func start() {
//        guard let productsViewController = ProductsViewController() as? ProductsViewController else { return }
//        productsViewController.coordinator = self
//        productsViewController.tabBarItem = UITabBarItem(
//            title: "Início",
//            image: UIImage(systemName: "house.fill"),
//            tag: 0
//        )
//        navigationController = UINavigationController(rootViewController: productsViewController)
//    }
//    
//    func showProductDetails(_ data: Product) {
//        
//        navigationController.pushViewController(ProductDetailsViewController(data: data), animated: true)
//    }
//    
//}
