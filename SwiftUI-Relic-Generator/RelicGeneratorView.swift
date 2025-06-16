//
//  RelicGeneratorView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

struct RelicGeneratorView: View {
  @Environment(\.modelContext) private var modelContext
  @EnvironmentObject var spellStore: SpellStore
  
  @State private var currentRelic: Relic?
  @State private var notes: String = ""
  
  var body: some View {
    NavigationView {
      VStack(spacing: 16) {
        if let relic = currentRelic {
          RelicDetailView(notes: $notes, relic: relic)
          Button("Save Relic") {
            if let r = currentRelic {
              let newRelic = Relic(
                name: r.name,
                material: r.material,
                form: r.form,
                spell: r.spell,
                casterLevel: r.casterLevel,
                saveDC: r.saveDC,
                attackBonus: r.attackBonus,
                drawback: r.drawback,
                origin: r.origin,
                notes: notes
              )
              modelContext.insert(newRelic)
              print("✅ Inserted relic: \(newRelic.name)")
              
              // DEBUG: check how many relics are in the context
              Task {
                let descriptor = FetchDescriptor<Relic>()
                if let result = try? modelContext.fetch(descriptor) {
                  print("🧪 Total relics in SwiftData: \(result.count)")
                } else {
                  print("⚠️ Failed to fetch relics")
                }
              }
            }
          }
          .buttonStyle(.borderedProminent)
        } else {
          Text("Tap below to generate a relic")
            .foregroundColor(.secondary)
        }
        
        Button("Generate New Relic") {
          currentRelic = generateRelic(from: spellStore.spells)
        }
        .padding()
      }
      .padding()
      .navigationTitle("Relic Generator")
    }
  }
}


#Preview {
  RelicGeneratorView()
    .environmentObject(SpellStore())
}
