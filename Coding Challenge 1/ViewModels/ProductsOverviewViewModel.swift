//
//  ProductsViewModel.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

class ProductsOverviewViewModel: ObservableObject {
  @Published var products: [Product] = []
  @Published var error: Error?

  private let productsService: ProductsServiceProtocol

  init(productsService: ProductsServiceProtocol = ProductsService()) {
    self.productsService = productsService
  }

  func getProducts() {
    do {
      products = try productsService.loadProductsFromJSON()
    } catch {
      self.error = error
      print(error.localizedDescription)
    }
  }
}
