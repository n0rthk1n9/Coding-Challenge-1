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
}
