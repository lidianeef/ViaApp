//
//  APICaller.swift
//  ViaApp
//
//  Created by Lidiane Ferreira on 15/05/23.
//

import Foundation

enum APIError: Error{
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()

    func getProducts(completion: @escaping (Result<ProductsModel, Error>) -> Void) {
        
        guard let url = URL(string: Constants.urlString) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(ProductsModel.self, from: data)
                print(results)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

