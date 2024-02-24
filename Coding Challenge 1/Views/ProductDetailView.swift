//
//  ProductDetailView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct ProductDetailView: View {
  @StateObject var viewModel: ProductDetailViewModel

  var body: some View {
    ScrollView {
      ZStack {
        ProductDetailImageView(imageUrl: viewModel.selectedImageUrl ?? viewModel.product.imageUrl)
      }
      VStack(alignment: .leading, spacing: 10) {
        Text(viewModel.product.price.formatted)
          .font(.title2)
        Text("inkl. MwSt., zzgl. Versandkosten")
          .font(.caption)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .padding(.top)
      if let variants = viewModel.product.variants {
        VStack(alignment: .leading) {
          Text("Farbe")
            .font(.headline)
          HStack {
            ForEach(variants, id: \.id) { variant in
              VariantSelectionButton(variant: variant, isSelected: viewModel.selectedVariantID == variant.id) {
                viewModel.selectVariant(variant)
              }
            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
      }
      VStack(alignment: .leading) {
        Text("Beschreibung")
          .font(.headline)
          .padding(.bottom)
        Text(viewModel.product.description)
          .font(.caption)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
