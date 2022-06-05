//
//  KeyboardViewModel.swift
//  ConverterPro
//
//  Created by Егор Никитин on 23.02.2022.
//

import Combine
import UIKit

class KeyboardViewModel: ObservableObject {
  
  @Published var type: NumSystemType
  
  @Published var layoutModel: KeyboardLayoutModel
  
  // storage
  private(set) var cancellableSet: Set<AnyCancellable> = []
  
  private let spacing: CGFloat = 15.0
  
  init(type: NumSystemType) {
    self.type = type
    self.layoutModel = KeybouardBuildDirector(spacing: self.spacing).buildKeyboard(for: type)
    
    $type
      .sink { type in
        print("new type = \(type)")
        self.layoutModel = KeybouardBuildDirector(spacing: self.spacing).buildKeyboard(for: type)
      }
      .store(in: &cancellableSet)
  }
  
}
