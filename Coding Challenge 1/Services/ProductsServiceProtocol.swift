//
//  ProductsServiceProtocol.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

protocol ProductsServiceProtocol {
  func loadProductsFromJSON() throws -> [Product]
}
