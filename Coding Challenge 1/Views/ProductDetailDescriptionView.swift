//
//  ProductDetailDescriptionView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 26.02.24.
//

import SwiftUI

struct ProductDetailDescriptionView: View {
  let description: String

  var body: some View {
    VStack(alignment: .leading) {
      Text("Beschreibung")
        .font(.headline)
        .padding(.bottom)
      Text(description)
        .font(.caption)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.bottom, 70)
  }
}

#Preview {
  ProductDetailDescriptionView(description: "Ein tolles Kleid")
}
