//
//  KeyboardView.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import SwiftUI

struct KeyboardView: View {
  
  @ObservedObject var viewModel: KeyboardViewModel
  
  init (viewModel: KeyboardViewModel) {
    _viewModel = ObservedObject(initialValue: viewModel)
  }
  
  var body: some View {
    VStack(spacing: viewModel.layoutModel.rowSpacing) {
      ForEach(viewModel.layoutModel.rows, id:\.id) { row in
        HStack(spacing: row.spacing) {
          ForEach(row.buttons, id:\.id) {button in
            KeyboardButton(viewModel: button)
              .frame(width: calculateButtonsWidth(spacing: row.spacing, maxButtonsInRow: viewModel.layoutModel.maxButtonsInRow, buttonSizeFactor: button.sizeFactor))
          }
        }
      }
    }
  }
  
  private func calculateButtonsWidth(spacing: CGFloat, maxButtonsInRow: Int, buttonSizeFactor: ButtonSizeFactor) -> CGFloat {
    switch buttonSizeFactor {
    case .allRow:
      return UIScreen.main.bounds.size.width - spacing * 2
    case .factor(let factor):
      return (((UIScreen.main.bounds.size.width - spacing * CGFloat(maxButtonsInRow + 1)) / CGFloat(maxButtonsInRow)) * CGFloat(factor)) + CGFloat(factor > 1 ? spacing * CGFloat(factor - 1) : 0)
    }
  }
}

struct KeyboardView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      KeyboardView(viewModel: KeyboardViewModel(type: .hexadecimal))
        .previewLayout(.fixed(width: 420, height: 420))
      KeyboardView(viewModel: KeyboardViewModel(type: .hexadecimal))
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 420, height: 420))
    }
  }
}
