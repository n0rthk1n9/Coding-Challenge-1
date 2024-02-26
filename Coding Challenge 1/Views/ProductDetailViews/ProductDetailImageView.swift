//
//  ProductDetailImageView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct ProductDetailImageView: View {
  var imageUrl: URL?

  var body: some View {
    AsyncImage(
      url: imageUrl,
      content: { image in
        image
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
          .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.66)
      },
      placeholder: {
        ProgressView()
      }
    )
  }
}

#Preview {
  ProductDetailImageView(
    imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1600856915/20167389-2HSkctsd.jpg")
  )
}
