//
//  KeyboardBuilders.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/22/22.
//

import UIKit

class KeybourdBuilder: KeyboardBuilderProtocol {
  private var rowBuilders: [KeyboardRowBuilderProtocol]
  private let rowSpacing: CGFloat
  
  required init(rowSpacing: CGFloat, closure: KeyboardBuildClosure) {
    self.rowSpacing = rowSpacing
    self.rowBuilders = [KeyboardRowBuilderProtocol]()
    closure(self)
  }
  
  func appendRowBuilder(_ builder: KeyboardRowBuilderProtocol) {
    rowBuilders.append(builder)
  }
  
  func setRowBuilders(rowBuilders: [KeyboardRowBuilderProtocol]) {
    self.rowBuilders = rowBuilders
  }
  
  func buildKeyboard() -> KeyboardLayoutModel {
    var rows = [KeyboardRowLayoutModel]()
    rowBuilders.enumerated().forEach { (index, rowBuilder) in
      rows.append(rowBuilder.buildKeyboardRow(id: index))
    }
    return KeyboardLayoutModel(rows: rows, rowsCount: rows.count, rowSpacing: rowSpacing)
  }
}

class KeybourdRowBuilder: KeyboardRowBuilderProtocol {
  private var buttonViewModels: [KeyboardButtonViewModel]
  private let spacing: CGFloat
  
  required init(spacing: CGFloat, closure: KeyboardRowBuildClosure) {
    self.spacing = spacing
    self.buttonViewModels = [KeyboardButtonViewModel]()
    closure(self)
  }
  
  func appendGlyph(symbol: String, isImage: Bool = false, color: UIColor, action: ButtonAction, sizeFactor: ButtonSizeFactor) {
    let glyph = Glyph(symbol: symbol, isImage: isImage, color: color)
    buttonViewModels.append(KeyboardButtonViewModel(id: buttonViewModels.count + 1 ,gliph: glyph, action: action, sizeFactor: sizeFactor))
  }
  
  func buildKeyboardRow(id: Int) -> KeyboardRowLayoutModel {
    return KeyboardRowLayoutModel(with: buttonViewModels, id: id, spacing: spacing)
  }
  
}
