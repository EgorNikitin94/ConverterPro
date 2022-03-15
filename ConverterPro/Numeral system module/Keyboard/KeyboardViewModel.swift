//
//  KeyboardViewModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import Combine
import Foundation

enum ButtonAction {
  case appendNumber
  case clearNumber
  case clearAllNumbers
  case addPoint
}

class KeyboardViewModel: ObservableObject {
  
  @Published var type: NumSystemType
  
  @Published var layoutModel: KeyboardLayoutModel
  
  init(type: NumSystemType) {
    self.type = type
    self.layoutModel = KeyboardLayoutModel(with: type)
  }
  
}
