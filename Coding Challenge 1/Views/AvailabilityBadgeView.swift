//
//  AvailabilityBadgeView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 23.02.24.
//

import SwiftUI

struct AvailabilityBadgeView: View {
  let product: Product

  var body: some View {
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
      )
  }
}

#Preview {
  AvailabilityBadgeView(product: .allProperties)
}
