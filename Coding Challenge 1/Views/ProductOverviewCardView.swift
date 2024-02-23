//
//  ProductOverviewCardView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct ProductOverviewCardView: View {
  let product: Product

  var body: some View {
    VStack(alignment: .leading) {
      ProductImageView(product: product)

      Text(product.title)
        .font(.headline)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .clipped()
        .padding()

      Text(product.price.formatted)
        .font(.headline)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .clipped()
        .padding(.horizontal)
        .padding(.bottom)
    }
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 4)
    .padding(.horizontal, 5)
  }
}

#Preview {
  ProductOverviewCardView(product: .allProperties)
}
