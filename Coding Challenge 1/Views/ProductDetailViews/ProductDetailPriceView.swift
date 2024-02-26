//
//  ProductDetailPriceView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 26.02.24.
//

import SwiftUI

struct ProductDetailPriceView: View {
  let formattedPrice: String

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(formattedPrice)
        .font(.title2)
      Text("inkl. MwSt., zzgl. Versandkosten")
        .font(.caption)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal)
    .padding(.top)
  }
}

#Preview {
  ProductDetailPriceView(formattedPrice: "124,44 €")
}
