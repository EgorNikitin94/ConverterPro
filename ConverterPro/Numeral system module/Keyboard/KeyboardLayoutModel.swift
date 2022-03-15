//
//  KeyboardLayoutModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 3/13/22.
//

import Foundation

fileprivate enum StringsStorage {
  static let decimal = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], [".", "0", "delete.backward.fill"], ["C"]]
  static let binary = [["0", "1"], [".", "delete.backward.fill"], ["C"]]
  static let octal = [["1", "2", "3"], ["4", "5", "6"], ["7", "0", "delete.backward.fill"], [".", "C"]]
  static let hex = [["A", "1", "2", "3", "D"], ["B", "4", "5", "6", "E"], ["C", "7", "8", "9", "F"], [".", "0", "delete.backward.fill"], ["C"]]
}

class KeyboardLayoutModel {
  
  var symbols: [[String]] = []
  
  init(with type: NumSystemType) {
    buildLayout(for: type)
  }
  
  private func buildLayout(for type: NumSystemType) {
    switch type {
    case .decimal:
      symbols = StringsStorage.decimal
    case .binary:
      symbols = StringsStorage.binary
    case .octal:
      symbols = StringsStorage.octal
    case .hexadecimal:
      symbols = StringsStorage.hex
    }
  }
  
}
