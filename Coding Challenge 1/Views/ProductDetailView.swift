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
            Button(variant.color) {
              viewModel.selectVariant(variant)
            }
            .buttonStyle(
              VariantButtonStyle(
                isSelected: viewModel.selectedVariantID == variant.id
              )
            )
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      }
    }
  }
}

struct VariantButtonStyle: ButtonStyle {
  var isSelected: Bool

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.system(size: 14))
      .foregroundColor(isSelected ? .white : .black)
      .padding(8)
      .background(
        ZStack {
          if isSelected {
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.black)
          } else {
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.white)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.black, lineWidth: 2)
              )
          }
        }
      )
      .padding(.top, 5)
  }
}

#Preview {
  ProductDetailView(viewModel: ProductDetailViewModel(product: .allProperties))
}
