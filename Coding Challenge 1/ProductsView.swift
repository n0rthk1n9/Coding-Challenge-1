//
//  ContentView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct ProductsView: View {
  @StateObject private var viewModel = ProductsViewModel()

  private var gridItemWidth: CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let totalSpacing = 10.0 * (CGFloat(columnsCount) - 1) // Total spacing between columns
    let totalPadding = 10.0 * 2 // Left and right padding
    let availableWidth = screenWidth - totalSpacing - totalPadding
    return availableWidth / CGFloat(columnsCount)
  }

  private let columnsCount = 2
  private var columns: [GridItem] {
    Array(repeating: .init(.fixed(gridItemWidth)), count: columnsCount)
  }

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 10) {
        ForEach(viewModel.products) { product in
          VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: product.imageUrl) { image in
              image
                .resizable()
            } placeholder: {
              ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
            .clipped()
            .cornerRadius(8)

            Text(product.title)
              .font(.headline)
              .multilineTextAlignment(.leading)
              .lineLimit(2)
              .padding(.top, 5)
              .clipped()
          }
          .padding()
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(Color.primary, lineWidth: 1)
          )
        }
      }
      .padding(.horizontal)
    }
    .onAppear {
      viewModel.getProducts()
    }
  }
}

#Preview {
  ProductsView()
}
