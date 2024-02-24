//
//  ProductDetailView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct ProductDetailView: View {
  let product: Product
  @State private var selectedVariantID: Int?
  @State private var selectedImageUrl: URL?

  var body: some View {
    ScrollView {
      ZStack {
        AsyncImage(
          url: selectedImageUrl ?? product.imageUrl,
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
        Text(product.price.formatted)
          .font(.title2)
        Text("inkl. MwSt., zzgl. Versandkosten")
          .font(.caption)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .padding(.top)
      if let variants = product.variants {
        HStack {
          ForEach(variants, id: \.id) { variant in
            Button(variant.color) {
              selectedVariantID = variant.id
              selectedImageUrl = variant.imageUrl
            }
            .buttonStyle(
              VariantButtonStyle(
                isSelected: selectedVariantID == variant.id
              )
            )
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      }
    }
    .onAppear {
      if let firstVariant = product.variants?.sorted(by: { $0.id < $1.id }).first {
        selectedVariantID = firstVariant.id
        selectedImageUrl = firstVariant.imageUrl
      } else {
        selectedImageUrl = product.imageUrl
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
  ProductDetailView(product: .allProperties)
}
