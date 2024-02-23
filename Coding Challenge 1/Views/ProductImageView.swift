//
//  ProductImageView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct ProductImageView: View {
  let product: Product

  var body: some View {
    AsyncImage(url: product.imageUrl) { image in
      image
        .resizable()
    } placeholder: {
      ProgressView()
    }
    .scaledToFill()
    .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
    .clipped()
    .cornerRadius(8)
    .overlay(
      AvailabilityBadgeView(product: product),
      alignment: .topLeading
    )
  }
}

#Preview {
  ProductImageView(product: .allProperties)
}
