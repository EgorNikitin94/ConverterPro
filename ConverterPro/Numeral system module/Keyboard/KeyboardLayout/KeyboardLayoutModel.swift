//
//  KeyboardLayoutModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 3/13/22.
//

import UIKit

struct KeyboardLayoutModel {
  
  var rows: [KeyboardRowLayoutModel]
  
  let rowsCount: Int
  
  let rowSpacing: CGFloat
  
  var maxButtonsInRow: Int {
    let maxButtons = rows.map { vm -> Int in
      return vm.buttonsCount
    }
    return maxButtons.max() ?? 0
  }
}
