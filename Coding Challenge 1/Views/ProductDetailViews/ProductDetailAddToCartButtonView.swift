//
//  ProductDetailAddToCartButtonView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 26.02.24.
//

import SwiftUI

struct ProductDetailAddToCartButtonView: View {
  let addToCartButtonText: String
  let isAddToCartButtonDisabled: Bool

  var body: some View {
    VStack {
      Spacer()
      Button(action: {}) {
        Text(addToCartButtonText)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(isAddToCartButtonDisabled ? Color.gray : Color.black)
          .cornerRadius(10)
      }
      .padding()
      .background(Color.white)
      .shadow(radius: 2)
      .disabled(isAddToCartButtonDisabled)
    }
    .frame(height: 60)
  }
}

#Preview {
  ProductDetailAddToCartButtonView(addToCartButtonText: "In die Einkaufstasche", isAddToCartButtonDisabled: false)
}
