//
//  KeyboardButton.swift
//  ConverterPro
//
//  Created by Егор Никитин on 26.02.2022.
//

import SwiftUI
import AVFoundation

struct KeyboardButton: View {
  
  let symbol: String
  
  var imageName: String?
  
  private let cornerRadius: Double = 10.0
  
  @GestureState private var isTapped = false
  
  init (symbol: String) {
    self.symbol = symbol
  }
  
  init(imageName: String) {
    self.imageName = imageName
    self.symbol = ""
  }
  
  var body: some View {
    let tap = DragGesture(minimumDistance: 0)
      .updating($isTapped) { (_, isTapped, _) in
        isTapped = true
        AudioServicesPlaySystemSound(1104)
      }
      .onEnded { _ in
        print(symbol)
      }
    ZStack {
      RoundedRectangle(cornerRadius: cornerRadius)
        .foregroundColor(color: isTapped ? AppColors.selected : AppColors.numInput)
        .scaleEffect(isTapped ? 1.05 : 1.0)
      if (imageName != nil) {
        Image(systemName: imageName!)
          .font(.title)
          .foregroundColor(.primary)
      } else {
        Text(symbol)
          .font(.largeTitle)
          .fontWeight(.medium)
      }
    }
    .animation(.easeIn(duration: 0.1), value: isTapped)
    .gesture(tap)
  }
}

struct KeyBoardButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      KeyboardButton(symbol: "9")
        .previewLayout(.sizeThatFits)
        .frame(width: 60, height: 60)
      KeyboardButton(symbol: "9")
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .frame(width: 60, height: 60)
    }
  }
}
