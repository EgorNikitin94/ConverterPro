//
//  KeyboardBuildDirector.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/22/22.
//

import UIKit

class KeybouardBuildDirector {
  
  let spacing: CGFloat
  
  let glyphColor: UIColor = UIColor { traint in
    switch traint.userInterfaceStyle {
    case .light:
      return UIColor.black
    case .dark:
      return UIColor.white
    default:
      return UIColor.black
    }
  }
  
  init (spacing: CGFloat) {
    self.spacing = spacing
  }
  
  func buildKeyboard(for type: NumSystemType) -> KeyboardLayoutModel {
    switch type {
    case .decimal:
      return buildDecimalKeyboard()
    case .binary:
      return buildBinaryKeyboard()
    case .octal:
      return buildOctalKeyboard()
    case .hexadecimal:
      return buildHexKeyboard()
    }
  }
  
  private func buildDecimalKeyboard() -> KeyboardLayoutModel {
    let keyboardBuilder: KeyboardBuilderProtocol = KeybourdBuilder(rowSpacing: spacing) { builder in
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "1", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "2", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "3", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "4", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "5", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "6", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "7", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "8", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "9", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: ".", isImage: false, color: glyphColor, action: .addPoint, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "0", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "delete.backward.fill", isImage: true, color: glyphColor, action: .clearSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "C", isImage: false, color: .red, action: .clearAllSymbols, sizeFactor: .allRow)
      }))
    }
    return keyboardBuilder.buildKeyboard()
  }
  
  private func buildBinaryKeyboard() -> KeyboardLayoutModel {
    let keyboardBuilder: KeyboardBuilderProtocol = KeybourdBuilder(rowSpacing: spacing) { builder in
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "0", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "1", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: ".", isImage: false, color: glyphColor, action: .addPoint, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "delete.backward.fill", isImage: true, color: glyphColor, action: .clearSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "C", isImage: false, color: .red, action: .clearAllSymbols, sizeFactor: .allRow)
      }))
    }
    
    return keyboardBuilder.buildKeyboard()
  }

  private func buildOctalKeyboard() -> KeyboardLayoutModel {
    let keyboardBuilder: KeyboardBuilderProtocol = KeybourdBuilder(rowSpacing: spacing) { builder in
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "1", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "2", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "3", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
                               
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "4", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "5", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "6", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "7", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "0", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "delete.backward.fill", isImage: true, color: glyphColor, action: .clearSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: ".", isImage: false, color: glyphColor, action: .addPoint, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "C", isImage: false, color: .red, action: .clearAllSymbols, sizeFactor: .factor(2))
      }))
    }
    return keyboardBuilder.buildKeyboard()
  }

  private func buildHexKeyboard() -> KeyboardLayoutModel {
    let keyboardBuilder: KeyboardBuilderProtocol = KeybourdBuilder(rowSpacing: spacing) { builder in
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "A", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "1", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "2", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "3", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "D", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
                               
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "B", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "4", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "5", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "6", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "E", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "C", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "7", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "8", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "9", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "F", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: ".", isImage: false, color: glyphColor, action: .addPoint, sizeFactor: .factor(2))
        rowBuilder.appendGlyph(symbol: "0", isImage: false, color: glyphColor, action: .appendSymbol, sizeFactor: .factor(1))
        rowBuilder.appendGlyph(symbol: "delete.backward.fill", isImage: true, color: glyphColor, action: .clearSymbol, sizeFactor: .factor(2))
      }))
      
      builder.appendRowBuilder(KeybourdRowBuilder(spacing: spacing, closure: { rowBuilder in
        rowBuilder.appendGlyph(symbol: "C", isImage: false, color: .red, action: .clearAllSymbols, sizeFactor: .allRow)
      }))
    }
    return keyboardBuilder.buildKeyboard()
  }
}
