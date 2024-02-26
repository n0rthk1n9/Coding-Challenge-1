//
//  ProductDetailVariantsView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 26.02.24.
//

import SwiftUI

struct ProductDetailVariantsView: View {
  let variants: [Variant]
  let selectedVariantID: Int?
  let onVariantSelected: (Variant) -> Void

  var body: some View {
    VStack(alignment: .leading) {
      Text("Farbe")
        .font(.headline)
      HStack {
        ForEach(variants, id: \.id) { variant in
          VariantSelectionButton(variant: variant, isSelected: selectedVariantID == variant.id) {
            onVariantSelected(variant)
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
  }
}

#Preview {
  ProductDetailVariantsView(
    variants: [.allProperties],
    selectedVariantID: 4713
  ) { variant in
    print(variant)
  }
}
