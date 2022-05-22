//
//  KeyboardButton.swift
//  ConverterPro
//
//  Created by Егор Никитин on 26.02.2022.
//

import SwiftUI
import AVFoundation

struct KeyboardButton: View {
  
  let glyph: Glyph
  
  let tappedAction: ButtonAction
  
  let sizeFactor: ButtonSizeFactor
  
  private let cornerRadius: Double = 10.0
  
  @GestureState private var isTapped = false
  
  init(viewModel: KeyboardButtonViewModel) {
    self.glyph = viewModel.gliph
    self.tappedAction = viewModel.action
    self.sizeFactor = viewModel.sizeFactor
  }
  
  var body: some View {
    let tap = DragGesture(minimumDistance: 0)
      .updating($isTapped) { (_, isTapped, _) in
        isTapped = true
        AudioServicesPlaySystemSound(1104)
      }
      .onEnded { _ in
        print(glyph.symbol)
      }
    ZStack {
      RoundedRectangle(cornerRadius: cornerRadius)
        .foregroundColor(color: isTapped ? AppColors.selected : AppColors.numInput)
        .scaleEffect(isTapped ? 1.05 : 1.0)
      if (glyph.isImage) {
        Image(systemName: glyph.symbol)
          .font(.title)
          .foregroundColor(Color(uiColor: glyph.color))
      } else {
        Text(glyph.symbol)
          .font(.largeTitle)
          .fontWeight(.medium)
          .foregroundColor(Color(uiColor: glyph.color))
      }
    }
    .animation(.easeIn(duration: 0.1), value: isTapped)
    .gesture(tap)
  }
}

struct KeyBoardButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      KeyboardButton(viewModel:
                      KeyboardButtonViewModel(id: 1, gliph: Glyph(symbol: "9", isImage: false, color: .black), action: .appendSymbol, sizeFactor: .factor(1)))
        .previewLayout(.sizeThatFits)
        .frame(width: 60, height: 60)
      KeyboardButton(viewModel:
                      KeyboardButtonViewModel(id: 1, gliph: Glyph(symbol: "9", isImage: false, color: .white), action: .appendSymbol, sizeFactor: .factor(1)))
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .frame(width: 60, height: 60)
    }
  }
}
