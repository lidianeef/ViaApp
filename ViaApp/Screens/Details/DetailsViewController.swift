//
//  ProductsDetailsViewController.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.


import UIKit

class DetailsViewController: UIViewController {
    
    let selectedProduct: Product
    static var productsModel: [Product] = [Product]()
    private var productsModelResponse: Product?
    private var productsModel: ProductsModel?
    
    
    private let productDetailCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                layout.itemSize = CGSize(width: 195, height: 350)
                layout.minimumInteritemSpacing = 0
                layout.minimumLineSpacing = 0
                layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.collectionView?.backgroundColor = .systemGray
        
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    init(selectedProduct: Product) {
        self.selectedProduct = selectedProduct
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureCollectionView()
    }
    
    
    public func configureCollectionView() {
        view.addSubview(productDetailCollection)
        productDetailCollection.delegate = self
//        productDetailCollection.dataSource = self
        productDetailCollection.translatesAutoresizingMaskIntoConstraints = false
        productDetailCollection.showsVerticalScrollIndicator = true
        productDetailCollection.showsHorizontalScrollIndicator = true
        NSLayoutConstraint.activate([
            productDetailCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productDetailCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            productDetailCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            productDetailCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productDetailCollection.frame = view.bounds
    }
    
    public func configure(with productsModel: [Product]){
        DetailsViewController.productsModel = productsModel
    }

    
}


extension DetailsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell,
              let productsModel = productsModel
        else {
            return UICollectionViewCell()
        }
        let data = productsModel.produtos[indexPath.row]
        cell.configure(data: data)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


}

