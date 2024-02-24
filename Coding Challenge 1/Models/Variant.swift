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

  static func fixture(
    id: Int = 0,
    color: String = "",
    imageUrl: URL = URL(string: "")!,
    isAvailable: Bool = true
  ) -> Variant {
    Variant(
      id: id,
      color: color,
      imageUrl: imageUrl,
      isAvailable: isAvailable
    )
  }

  static var allProperties: Variant {
    .fixture(
      id: 4713,
      color: "kastanienbraun",
      imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1600856915/20167389-2HSkctsd.jpg")!,
      isAvailable: true
    )
  }
}
