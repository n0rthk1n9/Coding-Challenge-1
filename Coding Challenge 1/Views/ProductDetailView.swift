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
        AsyncImage(
          url: viewModel.selectedImageUrl ?? viewModel.product.imageUrl,
          content: { image in
            image
              .resizable()
              .scaledToFill()
              .ignoresSafeArea()
              .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.66)
          },
          placeholder: {
            ProgressView()
          }
        )
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
        HStack {
          ForEach(variants, id: \.id) { variant in
            VariantSelectionButton(variant: variant, isSelected: viewModel.selectedVariantID == variant.id) {
              viewModel.selectVariant(variant)
            }
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      }
    }
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
