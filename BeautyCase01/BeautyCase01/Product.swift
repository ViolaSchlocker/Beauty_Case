//
//  Product.swift
//  BeautyCase
//
//  Created by Amann, Antonino, Schlocker on 25.06.21.
//

import Foundation

struct Product: Decodable {
    var name: String
    var description: String
    var date: String
    var mhd: String
    var imageName: String
    var thumbName: String
    var type: ProductType
    
}

enum ProductType: String, Decodable {
    case eyes = "eyes"
    case face = "face"
    case lips = "lips"
    
}


