//
//  Product.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation
import SwiftUI

struct Product: Codable, Equatable, Hashable, Identifiable {
  let id: Int
  let title: String
  let price: Price
  let imageUrl: URL
  let description: String
  let isAvailable: Bool
  let variants: [Variant]?
}

extension Product {
  var isAvailableText: String {
    return isAvailable ? "Auf Lager" : "Ausverkauft"
  }

  var isAvailableColor: Color {
    return isAvailable ? Color.green.opacity(0.8) : Color.red.opacity(0.8)
  }

  static func fixture(
    id: Int = 0,
    title: String = "",
    price: Price = Price(value: 0.0, currency: ""),
    imageUrl: URL = URL(string: "")!,
    description: String = "",
    isAvailable: Bool = true,
    variants: [Variant]? = [
      Variant(id: 0, color: "", imageUrl: URL(string: "")!, isAvailable: true)
    ]
  ) -> Product {
    Product(
      id: id,
      title: title,
      price: price,
      imageUrl: imageUrl,
      description: description,
      isAvailable: isAvailable,
      variants: variants
    )
  }

  static var allProperties: Product {
    .fixture(
      id: 4711,
      title: "Kleid",
      price: Price(value: 124.22, currency: "€"),
      imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1692190166/23120919-ledODpTJ.jpg")!,
      description: "Ein tolles Kleid",
      isAvailable: true,
      variants: [
        Variant(
          id: 4712,
          color: "grau meliert",
          imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1692190166/23120919-ledODpTJ.jpg")!,
          isAvailable: true
        ),
        Variant(
          id: 4713,
          color: "kastanienbraun",
          imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1600856915/20167389-2HSkctsd.jpg")!,
          isAvailable: false
        ),
        Variant(
          id: 4714,
          color: "schwarz",
          imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1692190099/23122048-j0pv69LB.jpg")!,
          isAvailable: true
        )
      ]
    )
  }
}
