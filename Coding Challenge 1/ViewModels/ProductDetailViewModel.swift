//
//  ProductDetailViewModel.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
  let product: Product
  @Published var selectedVariantID: Int?
  @Published var selectedImageUrl: URL?

  init(product: Product) {
    self.product = product
    if let firstVariant = product.variants?.sorted(by: { $0.id < $1.id }).first {
      selectedVariantID = firstVariant.id
      selectedImageUrl = firstVariant.imageUrl
    } else {
      selectedImageUrl = product.imageUrl
    }
  }

  func selectVariant(_ variant: Variant) {
    selectedVariantID = variant.id
    selectedImageUrl = variant.imageUrl
  }
}
