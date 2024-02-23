//
//  Product.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

struct Product: Codable, Equatable, Hashable, Identifiable {
  let id: Int
  let title: String
  let price: Price
  let imageUrl: URL
  let description: String
  let isAvailable: Bool
  let variants: [Variant]?
}
