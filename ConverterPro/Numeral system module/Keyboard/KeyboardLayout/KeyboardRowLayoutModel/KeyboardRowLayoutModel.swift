//
//  KeyboardLayoutModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 5/22/22.
//

import UIKit

struct KeyboardRowLayoutModel: Identifiable {
  
  typealias Builder = (KeyboardRowBuilderProtocol) -> Void
  
  var id: Int
  let buttons: [KeyboardButtonViewModel]
  let buttonsCount: Int
  let spacing: CGFloat
  
  init(with viewModels: [KeyboardButtonViewModel], id: Int, spacing: CGFloat) {
    self.buttons = viewModels
    self.id = id
    self.buttonsCount = viewModels.count
    self.spacing = spacing
  }
  
}
