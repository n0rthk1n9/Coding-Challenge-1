//
//  Variant.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

struct Variant: Codable, Equatable, Hashable, Identifiable {
  let id: Int
  let color: String
  let imageUrl: URL
  let isAvailable: Bool
}
