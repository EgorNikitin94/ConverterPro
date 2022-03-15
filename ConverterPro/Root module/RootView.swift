//
//  ContentView.swift
//  ConverterPro
//
//  Created by Егор Никитин on 14.02.2022.
//

import SwiftUI

struct RootView: View {
    var body: some View {
      TabView {
        NumeralSystemsConverterView()
          .tabItem {
            Image(systemName:"number.square.fill")
            Text("Numeral systems")
          }
        ConverterView()
          .tabItem {
            Image(systemName:"ruler.fill")
            Text("Converter")
          }
        CalculatorView()
          .tabItem {
            Image(systemName:"sum")
            Text("Calculator")
          }
      }.accentColor(Color.init(uiColor: .systemOrange))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        RootView()
        RootView()
          .preferredColorScheme(.dark)
      }
    }
}
