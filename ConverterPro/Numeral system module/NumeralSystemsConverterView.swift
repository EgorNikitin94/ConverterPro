//
//  NumeralSystemsConverterView.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import SwiftUI

struct NumeralSystemsConverterView: View {
  
  @ObservedObject var viewModel: NumeralSystemViewModel
  
  init() {
    self.viewModel = NumeralSystemViewModel()
  }
  
  var body: some View {
    BackgroundView {
      VStack(spacing: 15) {
        VStack(spacing: 15) {
          ForEach(viewModel.numberInputViewModels, id:\.id) { inputViewModel in
            NumberInputView(viewModel: inputViewModel)
              .onTapGesture {
                viewModel.didSelectInputView(index: inputViewModel.id)
              }
          }
        }
        KeyboardView(viewModel: viewModel.keyboardViewModel)
          .animation(.easeIn, value: viewModel.keyboardViewModel.type)
      }
      .padding(15)
    }
  }
}

struct NumeralSystemsConverterView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NumeralSystemsConverterView()
      NumeralSystemsConverterView()
        .preferredColorScheme(.dark)
    }
  }
}
