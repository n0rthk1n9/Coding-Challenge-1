//
//  ProductDetailNavigationBar.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 26.02.24.
//

import SwiftUI

struct ProductDetailNavigationBar: View {
  @Environment(\.presentationMode) var presentationMode
  @State private var isFavorite: Bool = false

  var body: some View {
    HStack {
      Button(action: {
        presentationMode.wrappedValue.dismiss()
      }) {
        Image(systemName: "chevron.backward")
          .font(.title2)
          .foregroundColor(.black)
      }
      Spacer()
      Button(action: {
        isFavorite.toggle()
      }) {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
          .font(.title2)
          .foregroundColor(.black)
      }
    }
    .padding(.horizontal, 25)
    .padding(.top, 55)
  }
}

#Preview {
  ProductDetailNavigationBar()
}
