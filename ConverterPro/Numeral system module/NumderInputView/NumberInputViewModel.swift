//
//  NumberInputViewModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import Combine
import Foundation

class NumberInputViewModel: Identifiable, ObservableObject {
  
  @Published var numValue: String
  
  @Published var isSelected: Bool
  
  var id: Int
  
  let numSystemType: NumSystemType
  
  var title: String
  
  init(type: NumSystemType) {
    self.numSystemType = type
    self.id = type.rawValue
    self.numValue = "0"
    switch type {
    case .decimal:
      self.title = "Dec"
      self.isSelected = true
    case .binary:
      self.title = "Bin"
      self.isSelected = false
    case .octal:
      self.title =  "Oct"
      self.isSelected = false
    case .hexadecimal:
      self.title = "Hex"
      self.isSelected = false
    }
  }
}


extension NumberInputViewModel: Hashable {
  static func == (lhs: NumberInputViewModel, rhs: NumberInputViewModel) -> Bool {
    return lhs.id == rhs.id && lhs.isSelected == rhs.isSelected
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
    hasher.combine(self.isSelected)
  }
}
