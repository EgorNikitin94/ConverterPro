//
//  BackgroundView.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
  
  private var content: Content
  
  @Environment(\.colorScheme) private var colorScheme
  
  private var background: Color {
    AppColors.background.getColor(shame: colorScheme)
  }
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    background
      .ignoresSafeArea()
      .overlay(content)
  }
}
