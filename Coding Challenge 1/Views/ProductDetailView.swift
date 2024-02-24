//
//  ProductDetailView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct ProductDetailView: View {
  let product: Product

  var body: some View {
    Text(product.title)
  }
}

#Preview {
  ProductDetailView(product: .allProperties)
}
