//
//  SwiftUI_Relic_GeneratorApp.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

import SwiftData

@main
struct SwiftUI_Relic_GeneratorApp: App {
  @StateObject private var spellStore = SpellStore()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(spellStore)
    }
    .modelContainer(for: Relic.self)
  }
}

