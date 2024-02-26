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
        VStack(alignment: .leading) {
          Text("Beschreibung")
            .font(.headline)
            .padding(.bottom)
          Text(viewModel.product.description)
            .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 70)
      }
      VStack {
        Spacer()
        Button(action: {}) {
          Text(viewModel.addToCartButtonText)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(viewModel.isAddToCartButtonDisabled ? Color.gray : Color.black)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
        .disabled(viewModel.isAddToCartButtonDisabled)
      }
      .frame(height: 60)
    }
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
