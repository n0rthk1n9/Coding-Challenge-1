//
//  ContentView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct ProductsOverviewView: View {
  @StateObject private var viewModel = ProductsViewModel()

  private var gridItemWidth: CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let totalSpacing = 20.0 * (CGFloat(columnsCount) - 1)
    let totalPadding = 5.0 * 2
    let availableWidth = screenWidth - totalSpacing - totalPadding
    return availableWidth / CGFloat(columnsCount)
  }

  private let columnsCount = 2

  private var columns: [GridItem] {
    Array(repeating: .init(.fixed(gridItemWidth)), count: columnsCount)
  }

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(viewModel.products) { product in
            ProductsOverviewCardView(product: product)
          }
        }
        .navigationDestination(for: Product.self) { product in
          Text(product.title)
        }
      }
      .navigationTitle("Produktübersicht")
    }
    .onAppear {
      viewModel.getProducts()
    }
  }
}

#Preview {
  ProductsOverviewView()
}
