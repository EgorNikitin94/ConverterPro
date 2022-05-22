//
//  Glyph.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/22/22.
//

import UIKit

struct Glyph {
  let symbol: String
  let isImage: Bool
  let color: UIColor
  
  init(symbol: String, isImage: Bool, color: UIColor) {
    self.symbol = symbol
    self.isImage = isImage
    self.color = color
  }
}
