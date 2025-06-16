//
//  SavedRelicView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct SavedRelicsView: View {
  @Environment(\.modelContext) private var context
  @State private var searchText = ""
  
  @Query(filter: #Predicate<Relic> { relic in
    // This will be updated dynamically
    true
  }) var relics: [Relic]
  
  var filteredRelics: [Relic] {
    if searchText.isEmpty {
      return relics
    } else {
      return relics.filter {
        $0.name.localizedCaseInsensitiveContains(searchText) ||
        $0.spell.localizedCaseInsensitiveContains(searchText) ||
        $0.notes.localizedCaseInsensitiveContains(searchText)
      }
    }
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(filteredRelics) { relic in
          NavigationLink(destination: RelicDetailView(notes: .constant(relic.notes), relic: relic)) {
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
      .searchable(text: $searchText, prompt: "Search by name, spell, or notes")
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
    // Create an in-memory container for previewing
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Relic.self, configurations: config)
    
    // Insert mock relics into the preview context
    let context = container.mainContext
    
    context.insert(
      Relic(
        name: "Wyrmfang",
        material: "Obsidian",
        form: "Amulet",
        spell: "Fireball",
        casterLevel: 5,
        saveDC: 15,
        attackBonus: 6,
        drawback: "Scorches the wearer",
        origin: "Unearthed from the Ashen Wastes"
      )
    )
    
    context.insert(
      Relic(
        name: "Frostbind",
        material: "Ivory",
        form: "Ring",
        spell: "Ray of Frost",
        casterLevel: 3,
        saveDC: 0,
        attackBonus: 7,
        drawback: "Numbs the hand it’s worn on",
        origin: "Forged by frost druids"
      )
    )
    
    // Return the view using this container
    return SavedRelicsView()
      .modelContainer(container)
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
