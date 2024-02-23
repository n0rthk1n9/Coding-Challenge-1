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
