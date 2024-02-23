//
//  ContentView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct ProductsView: View {
  @StateObject private var viewModel = ProductsViewModel()

  var body: some View {
    List(viewModel.products) { product in
      Text(product.title)
    }
    .onAppear {
      viewModel.getProducts()
    }
  }
}

#Preview {
  ProductsView()
}
