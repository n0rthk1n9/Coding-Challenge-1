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
        ProductDetailPriceView(formattedPrice: viewModel.product.price.formatted)
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
    .navigationBarTitleDisplayMode(.inline)
    .toolbar(.hidden)
    .ignoresSafeArea(edges: .top)
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
