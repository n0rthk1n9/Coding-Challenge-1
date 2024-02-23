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
            VStack(alignment: .leading) {
              AsyncImage(url: product.imageUrl) { image in
                image
                  .resizable()
              } placeholder: {
                ProgressView()
              }
              .scaledToFill()
              .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
              .clipped()
              .cornerRadius(8)
              .overlay(
                Text(product.isAvailableText)
                  .fontWeight(Font.Weight.medium)
                  .font(Font.system(size: 12))
                  .foregroundColor(Color.white)
                  .padding([.leading, .trailing], 8)
                  .padding([.top, .bottom], 4)
                  .background(product.isAvailableColor)
                  .clipShape(
                    .rect(
                      topLeadingRadius: 8,
                      bottomLeadingRadius: 0,
                      bottomTrailingRadius: 8,
                      topTrailingRadius: 0
                    )
                  ),
                alignment: .topLeading
              )

              Text(product.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .clipped()
                .padding()

              Text(product.price.formatted)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .clipped()
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding(.horizontal, 5)
          }
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
  ProductsView()
}
