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
    ZStack(alignment: .bottom) {
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
          ProductDetailVariantsView(
            variants: variants,
            selectedVariantID: viewModel.selectedVariantID,
            onVariantSelected: { variant in
              viewModel.selectVariant(variant)
            }
          )
        }
        ProductDetailDescriptionView(description: viewModel.product.description)
      }
      ProductDetailAddToCartButtonView(
        addToCartButtonText: viewModel.addToCartButtonText,
        isAddToCartButtonDisabled: viewModel.isAddToCartButtonDisabled
      )
    }
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
