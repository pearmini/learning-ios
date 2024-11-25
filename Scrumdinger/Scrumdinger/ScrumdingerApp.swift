//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by subairui on 11/2/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  @State private var scrums = DailyScrum.sampleData
  
  var body: some Scene {
    WindowGroup {
      ScrumsView(scrums: $scrums)
    }
  }
}
