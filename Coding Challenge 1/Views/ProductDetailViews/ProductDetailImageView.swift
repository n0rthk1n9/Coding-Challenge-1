//
//  ProductDetailImageView.swift
//  Coding Challenge 1
//
//  Created by Jan Armbrust on 24.02.24.
//

import SwiftUI

struct ProductDetailImageView: View {
  var imageUrl: URL?
  @Environment(\.presentationMode) var presentationMode
  @State private var isFavorite: Bool = false

  var body: some View {
    ZStack(alignment: .top) {
      AsyncImage(
        url: imageUrl,
        content: { image in
          image.resizable()
            .scaledToFill()
            .ignoresSafeArea(edges: .top)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.66)
        },
        placeholder: {
          ProgressView()
        }
      )

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
}

#Preview {
  ProductDetailImageView(
    imageUrl: URL(string: "https://image01.bonprix.de/assets/275x385/1600856915/20167389-2HSkctsd.jpg")
  )
}
