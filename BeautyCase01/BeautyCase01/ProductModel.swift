//
//  ProductModel.swift
//  BeautyCase
//
//  Created by Amann, Antonino, Schlocker on 25.06.21.
//

import Foundation

class ProductModel {
    var products: [Product] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "products2", withExtension: "json"){
            do {
                let productData = try Data (contentsOf: url)
                products = try JSONDecoder().decode([Product].self, from: productData)
            } catch {
                print(error)
            }
        }
    }
    
    func products(forType type: ProductType?) -> [Product] {
                  guard let type = type else {
                  return products
                  }
                  return products.filter { $0.type == type}
                  }
}
