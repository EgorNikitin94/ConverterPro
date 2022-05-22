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
          }
        }
      }
    }
    
//    switch viewModel.type {
//    case .decimal:
//      DecimalKeyboard()
//    case .hexadecimal:
//      HexKeyboard()
//    case .binary:
//      BinaryKeyboard()
//    case .octal :
//      OctalKeyboard()
//    }
  }
}

//struct DecimalKeyboard: View {
//  var body: some View {
//    VStack(spacing: 15) {
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "1")
//        KeyboardButton(symbol: "2")
//        KeyboardButton(symbol: "3")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "4")
//        KeyboardButton(symbol: "5")
//        KeyboardButton(symbol: "6")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "7")
//        KeyboardButton(symbol: "8")
//        KeyboardButton(symbol: "9")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: ".")
//        KeyboardButton(symbol: "0")
//        KeyboardButton(imageName: "delete.backward.fill")
//      }
//      HStack {
//        KeyboardButton(symbol: "C")
//          .foregroundColor(.red)
//      }
//    }
//  }
//}
//
//struct HexKeyboard: View {
//  var body: some View {
//    VStack(spacing: 15) {
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "A")
//        KeyboardButton(symbol: "1")
//        KeyboardButton(symbol: "2")
//        KeyboardButton(symbol: "3")
//        KeyboardButton(symbol: "D")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "B")
//        KeyboardButton(symbol: "4")
//        KeyboardButton(symbol: "5")
//        KeyboardButton(symbol: "6")
//        KeyboardButton(symbol: "E")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "C")
//        KeyboardButton(symbol: "7")
//        KeyboardButton(symbol: "8")
//        KeyboardButton(symbol: "9")
//        KeyboardButton(symbol: "F")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: ".")
//        KeyboardButton(symbol: "0")
//          .frame(width:(UIScreen.main.bounds.size.width - 15 * 6) / 5)
//        KeyboardButton(imageName: "delete.backward.fill")
//      }
//      HStack {
//        KeyboardButton(symbol: "C")
//          .foregroundColor(.red)
//      }
//    }
//  }
//}
//
//struct BinaryKeyboard: View {
//  var body: some View {
//    VStack(spacing: 15) {
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "0")
//        KeyboardButton(symbol: "1")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: ".")
//        KeyboardButton(imageName: "delete.backward.fill")
//      }
//      HStack {
//        KeyboardButton(symbol: "C")
//          .foregroundColor(.red)
//      }
//    }
//  }
//}
//
//struct OctalKeyboard: View {
//  var body: some View {
//    VStack(spacing: 15) {
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "1")
//        KeyboardButton(symbol: "2")
//        KeyboardButton(symbol: "3")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "4")
//        KeyboardButton(symbol: "5")
//        KeyboardButton(symbol: "6")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: "7")
//        KeyboardButton(symbol: "0")
//        KeyboardButton(imageName: "delete.backward.fill")
//      }
//      HStack(spacing: 15) {
//        KeyboardButton(symbol: ".")
//        KeyboardButton(symbol: "C")
//          .foregroundColor(.red)
//      }
//
//    }
//  }
//}

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
