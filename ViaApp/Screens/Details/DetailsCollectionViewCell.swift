//
//  DetailsCollectionViewCell.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 16/05/23.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {


        static let identifier = "DetailsCollectionViewCell"

        private let contentStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.backgroundColor = .blue
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 2
            return stackView
        }()
        private let productImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .bottomRight
            imageView.backgroundColor = .yellow

            return imageView
        }()
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
            label.numberOfLines = 3
            label.textColor = .darkGray
            label.backgroundColor = .yellow
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let idLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
            label.textColor = .systemGray
            label.backgroundColor = .darkGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let previousPriceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            label.textColor = .systemGray
            label.backgroundColor = .yellow
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let priceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            label.textColor = .systemBlue
            label.backgroundColor = .darkGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let paymentLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
            label.textColor = .systemGreen
            label.backgroundColor = .yellow
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private let discountLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
            label.textColor = .systemGreen
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(productImageView)
            configureSubviews()
            configureConstraints()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            productImageView.frame = contentView.bounds
        }
        
        private func configureSubviews() {
            addSubview(contentStackView)
            contentStackView.addArrangedSubview(productImageView)
            contentStackView.addArrangedSubview(nameLabel)
            contentStackView.addArrangedSubview(idLabel)
            contentStackView.addArrangedSubview(previousPriceLabel)
            contentStackView.addArrangedSubview(priceLabel)
            contentStackView.addArrangedSubview(paymentLabel)
            contentStackView.addArrangedSubview(discountLabel)
            
        }
        
        
        private func configureConstraints() {
            NSLayoutConstraint.activate([
                contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
                productImageView.heightAnchor.constraint(equalToConstant: 170),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                previousPriceLabel.heightAnchor.constraint(equalToConstant: 20),
                priceLabel.heightAnchor.constraint(equalToConstant: 20),
                paymentLabel.heightAnchor.constraint(equalToConstant: 20),
            ])
        }
        
        
         
         public func configure(data: Product) {
             let url = URL(string: data.imagemUrl)
             productImageView.sd_setImage(with: url)
             
             nameLabel.text = "nome"
             idLabel.text = "idlabel"
             previousPriceLabel.text = "preco antigo"
             priceLabel.text = "R$  preco atual"
             paymentLabel.text = "plano pagamento"
             discountLabel.text = "40 %"
             
         }
     }
