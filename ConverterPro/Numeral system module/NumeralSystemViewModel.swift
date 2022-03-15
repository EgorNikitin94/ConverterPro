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
  
  @Published var keuboardViewModel: KeyboardViewModel
  
  @Published var characterArray: [Character] = []
  
  init() {
    self.numberInputViewModels = []
    self.keuboardViewModel = KeyboardViewModel(type: .decimal)
    setUpNumberInputViewModels()
  }
  
  func didSelectInputView(index: Int) {
    numberInputViewModels.forEach { numberInputViewModel in
      numberInputViewModel.isSelected = numberInputViewModel.id == index ? true : false
    }
    keuboardViewModel.type = NumSystemType.init(rawValue: index)!
  }
  
  private func setUpNumberInputViewModels() {
    for numSystem in NumSystemType.allCases {
      self.numberInputViewModels.append(NumberInputViewModel(type: numSystem))
    }
  }
}
