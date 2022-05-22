//
//  KeyboardBuilderProtocols.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/22/22.
//

import UIKit

protocol KeyboardBuilderProtocol {
  typealias KeyboardBuildClosure = (KeyboardBuilderProtocol) -> Void
  init(rowSpacing: CGFloat, closure: KeyboardBuildClosure)
  func setRowBuilders(rowBuilders: [KeyboardRowBuilderProtocol])
  func appendRowBuilder(_ builder: KeyboardRowBuilderProtocol)
  func buildKeyboard() -> KeyboardLayoutModel
}

protocol KeyboardRowBuilderProtocol {
  typealias KeyboardRowBuildClosure = (KeyboardRowBuilderProtocol) -> Void
  init(spacing: CGFloat, closure: KeyboardRowBuildClosure)
  func appendGlyph(symbol: String, isImage: Bool, color: UIColor, action: ButtonAction, sizeFactor: ButtonSizeFactor)
  func buildKeyboardRow(id: Int) -> KeyboardRowLayoutModel
}
