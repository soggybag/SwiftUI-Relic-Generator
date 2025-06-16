//
//  ContentView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      RelicGeneratorView()
        .tabItem {
          Label("Generate", systemImage: "wand.and.stars")
        }
      
      SavedRelicsView()
        .tabItem {
          Label("Saved", systemImage: "scroll")
        }
    }
  }
}


#Preview {
  ContentView()
    .environmentObject(SpellStore())
}
