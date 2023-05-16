//
//  ProductsData.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.
//

import UIKit

struct ProductsModel: Codable {
    let produtos: [Product]
}

struct Product: Codable {
    let id: Int
    let sku: Int
    let nome: String
    let disponivel: Bool
    let descricao: String
    let imagemUrl: String
    let classificacao: Int
    let preco: Price
}

struct Price: Codable {
    let planoPagamento: String
    let valorParcela: Double
    let quantidadeMaximaParcelas: Int
    let precoAtual: Double
    let precoAnterior: Double
    let porcentagemDesconto: Int
    let descontoFormaPagamento: String?
}
