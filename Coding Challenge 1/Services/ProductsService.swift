//
//  ProductsService.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

struct ProductsService: ProductsServiceProtocol {
  func loadProductsFromJSON() throws -> [Product] {
    var products: [Product] = []

    do {
      if let fileURL = Bundle.main.url(forResource: "products", withExtension: "json") {
        let jsonData = try Data(contentsOf: fileURL)
        products = try JSONDecoder().decodeLogging([Product].self, from: jsonData)
      }

      return products
    } catch {
      throw error
    }
  }
}
