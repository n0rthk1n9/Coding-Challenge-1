//
//  VariantSelectionButton.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct VariantSelectionButton: View {
  var variant: Variant
  var isSelected: Bool
  var action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(variant.color)
        .font(.system(size: 14))
        .foregroundColor(isSelected ? .white : .black)
        .padding(8)
        .background(
          ZStack {
            if isSelected {
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
            } else {
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay(
                  RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                )
            }
          }
        )
        .cornerRadius(10)
    }
    .padding(.top, 5)
  }
}

#Preview {
  VariantSelectionButton(variant: .allProperties, isSelected: true, action: {})
}
