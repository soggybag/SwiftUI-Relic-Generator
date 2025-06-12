//
//  SavedRelicView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct SavedRelicsView: View {
  @Query var relics: [Relic]
  @Environment(\.modelContext) private var context
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(relics) { relic in
          NavigationLink(destination: RelicDetailView(relic: relic)) {
            VStack(alignment: .leading) {
              Text(relic.name)
                .font(.headline)
              Text("Casts \(relic.spell)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
          }
        }
        .onDelete(perform: deleteRelics)
      }
      .navigationTitle("Saved Relics")
      .toolbar {
        Button("Add") {
          let newRelic = Relic(
            name: "Wyrmfang",
            material: "Bone",
            form: "Ring",
            spell: "Fireball",
            casterLevel: 5,
            saveDC: 15,
            attackBonus: 6,
            drawback: "Burns wielder",
            origin: "Found in the Ashen Wastes"
          )
          context.insert(newRelic)
        }
      }
    }
  }
  
  func deleteRelics(at offsets: IndexSet) {
    for index in offsets {
      let relic = relics[index]
      context.delete(relic)
    }
  }
}



#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Relic.self, configurations: config)
    
    let context = container.mainContext
    let mockRelic = Relic(
      name: "Wyrmfang",
      material: "Bone",
      form: "Ring",
      spell: "Fireball",
      casterLevel: 5,
      saveDC: 15,
      attackBonus: 6,
      drawback: "Burns wielder",
      origin: "Ashen Wastes"
    )
    context.insert(mockRelic)
    
    return SavedRelicsView()
      .modelContainer(container)
  } catch {
    return Text("Failed to load preview")
  }
}
