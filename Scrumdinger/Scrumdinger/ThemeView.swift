//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by subairui on 11/23/24.
//

import SwiftUI


struct ThemeView: View {
  let theme: Theme
  
  var body: some View {
    Text(theme.name)
      .padding(4)
      .frame(maxWidth: .infinity)
      .background(theme.mainColor)
      .foregroundColor(theme.accentColor)
  }
}


struct ThemeView_Previews: PreviewProvider {
  static var previews: some View {
    ThemeView(theme: .buttercup)
  }
}
