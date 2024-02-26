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

  var addToCartButtonText: String {
    if let selectedVariantID = selectedVariantID,
       let variant = product.variants?.first(where: { $0.id == selectedVariantID })
    {
      return variant.isAvailable ? "In die Einkaufstasche" : "Nicht verfügbar"
    } else if product.variants?.isEmpty ?? true {
      return product.isAvailable ? "In die Einkaufstasche" : "Nicht verfügbar"
    } else {
      return "Wähle eine Farbe"
    }
  }

  var isAddToCartButtonDisabled: Bool {
    if let selectedVariantID = selectedVariantID,
       let variant = product.variants?.first(where: { $0.id == selectedVariantID })
    {
      return !variant.isAvailable
    } else if product.variants?.isEmpty ?? true {
      return !product.isAvailable
    } else {
      return true
    }
  }
}
