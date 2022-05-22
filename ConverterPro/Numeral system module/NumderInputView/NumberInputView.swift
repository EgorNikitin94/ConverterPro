//
//  NumberInputView.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import SwiftUI

struct NumberInputView: View {
  
  @ObservedObject var viewModel: NumberInputViewModel
  
  init(viewModel: NumberInputViewModel) {
    _viewModel = ObservedObject(initialValue: viewModel)
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10.0)
        .foregroundColor(color: viewModel.isSelected ? AppColors.selected : AppColors.numInput)
      HStack {
        Text(viewModel.title)
          .font(.title2)
          .fontWeight(.bold)
          .padding(.horizontal)
        Spacer()
        Text(viewModel.numValue)
          .lineLimit(1)
          .font(.title)
          .padding(.horizontal)
      }
    }.animation(.easeIn, value: viewModel.isSelected)
  }
}

struct NumberInputView_Previews: PreviewProvider {
  static var previews: some View {
    NumberInputView(viewModel: NumberInputViewModel(type: .decimal))
      .previewLayout(.sizeThatFits)
      .frame(height: 60)
  }
}
