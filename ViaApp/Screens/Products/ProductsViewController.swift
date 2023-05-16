//
//  ProductsViewController.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.
//

import UIKit

class ProductsViewController: UIViewController {
    
    static var productsModel: [Product] = [Product]()
    private var productsModelResponse: Product?
    private var productsModel: ProductsModel?
    var didSelectProduct: ((Product) -> Void)?

    
    private let productsFeedCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let itemWidth = collectionView.bounds.width / 2 - layout.minimumInteritemSpacing
        layout.itemSize = CGSize(width: 195, height: 350)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.scrollDirection = .vertical
        layout.collectionView?.backgroundColor = .systemBackground
        
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureNavbar()
        getProducts()
        
    }
        
        
    public func configureCollectionView() {
        view.addSubview(productsFeedCollection)
        productsFeedCollection.delegate = self
        productsFeedCollection.dataSource = self
        productsFeedCollection.translatesAutoresizingMaskIntoConstraints = false
        productsFeedCollection.showsVerticalScrollIndicator = true
        productsFeedCollection.showsHorizontalScrollIndicator = true
        NSLayoutConstraint.activate([
            productsFeedCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productsFeedCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            productsFeedCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            productsFeedCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
        
    
    private func configureNavbar() {
        var titleNavBar = "Smart TV"
        navigationItem.title = titleNavBar
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        
        let leftButtonImage = UIImage(systemName: "chevron.backward")
        let leftButton = UIBarButtonItem(image: leftButtonImage, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButtonImage = UIImage(systemName: "slider.vertical.3")
        let rightButton = UIBarButtonItem(image: rightButtonImage, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .systemBackground
    }
        
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productsFeedCollection.frame = view.bounds
    }
    
    public func configure(with productsModel: [Product]){
        ProductsViewController.productsModel = productsModel
    }
        
    
    private func getProducts() {
        APICaller.shared.getProducts { [weak self] results in
            DispatchQueue.main.async {
                switch results {
                case .success(let productsModel):
                    self?.productsModel = productsModel
                    self?.productsFeedCollection.reloadData()
                case.failure(let error):
                    print(error)
                }
            }
            print()
        }
    }
}


    extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell,
                  let productsModel = productsModel
            else {
                return UICollectionViewCell()
            }
            let data = productsModel.produtos[indexPath.row]
            cell.configure(data: data)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return productsModel?.produtos.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            guard let selectedProduct = productsModel?.produtos[indexPath.item] else {
                return
            }
            didSelectProduct?(selectedProduct)
            
            let DetailsViewController = DetailsViewController(selectedProduct: selectedProduct)
            
            self.navigationController?.pushViewController(DetailsViewController, animated: true)

            print("product selected")
        }
    }






//    var coordinator: ProductsCoordinator?
//        coordinator?.showProductDetails(data)
//         guard let data = productsModel?.produtos[indexPath.row] else {
//                return
//            }

