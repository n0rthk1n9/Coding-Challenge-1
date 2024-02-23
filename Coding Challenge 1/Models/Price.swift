//
//  Price.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import Foundation

struct Price: Codable, Equatable, Hashable {
  let value: Double
  let currency: String
}

extension Price {
  var formatted: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = currency

    guard let formattedString = formatter.string(from: NSNumber(value: value)) else {
      return "\(currency) \(value)"
    }
    return formattedString
  }
}
