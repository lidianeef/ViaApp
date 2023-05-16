//
//  ProductsCollectionViewCell.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.
//

import UIKit
import SDWebImage

class ProductsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductsCollectionViewCell"
    
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private let productsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let starImageView: UIImageView = {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
        starImageView.contentMode = .scaleAspectFit
        return starImageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        label.numberOfLines = 3
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let classificationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let previousPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let paymentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productsImageView)
        configureSubviews()
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        productsImageView.frame = contentView.bounds
    }
    

    
    private func configureSubviews() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(productsImageView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(classificationLabel)
        contentStackView.addArrangedSubview(previousPriceLabel)
        contentStackView.addArrangedSubview(priceLabel)
        contentStackView.addArrangedSubview(paymentLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            productsImageView.heightAnchor.constraint(equalToConstant: 170),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            classificationLabel.heightAnchor.constraint(equalToConstant: 20),
            previousPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            paymentLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    public func configure(data: Product) {
        
        let url = URL(string: data.imagemUrl)
        productsImageView.sd_setImage(with: url)
        
        nameLabel.text = data.nome
        classificationLabel.text = "\(data.classificacao)"
        previousPriceLabel.text = "R$  \(data.preco.precoAnterior)"
        priceLabel.text = "R$  \(data.preco.precoAtual)"
        paymentLabel.text = data.preco.planoPagamento
    }
}
