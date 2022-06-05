//
//  NumeralSystemViewModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import Combine
import Foundation
import UIKit

enum NumSystemType: Int, CaseIterable {
  case decimal
  case binary
  case octal
  case hexadecimal
}

class NumeralSystemViewModel: ObservableObject {
  
  @Published var numberInputViewModels: [NumberInputViewModel]
  
  @Published var keyboardViewModel: KeyboardViewModel
  
  @Published var characterArray: [Character] = []
  
  init() {
    self.numberInputViewModels = NumSystemType.allCases.map({ (numSystem) -> NumberInputViewModel in
      return NumberInputViewModel(type: numSystem)
    })
    self.keyboardViewModel = KeyboardViewModel(type: .decimal)
  }
  
  func didSelectInputView(index: Int) {
    numberInputViewModels.forEach { numberInputViewModel in
      numberInputViewModel.isSelected = numberInputViewModel.id == index ? true : false
    }
    keyboardViewModel.type = NumSystemType.init(rawValue: index)!
  }
  
}
