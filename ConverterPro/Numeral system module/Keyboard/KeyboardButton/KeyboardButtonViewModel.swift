//
//  KeyboardButtonViewModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/15/22.
//

import Combine
import Foundation

enum ButtonAction {
  case appendSymbol
  case clearSymbol
  case clearAllSymbols
  case addPoint
}

enum ButtonSizeFactor {
  case allRow
  case factor(UInt)
}

class KeyboardButtonViewModel: Identifiable {
  
  var id: Int
  
  let gliph: Glyph
  
  let action: ButtonAction
  
  let sizeFactor: ButtonSizeFactor
  
  init(id: Int, gliph: Glyph, action: ButtonAction, sizeFactor: ButtonSizeFactor) {
    self.id = id
    self.gliph = gliph
    self.action = action
    self.sizeFactor = sizeFactor
  }
  
}
