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

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if let relic = currentRelic {
                    RelicDetailView(relic: relic)
                    Button("Save Relic") {
                        modelContext.insert(relic)
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

    func generateRelic(from spells: [Spell]) -> Relic {
        guard let spell = spells.randomElement() else {
            fatalError("No spells available")
        }

        let casterLevel = max(spell.level * 2, Int.random(in: spell.level...spell.level + 5))
        let saveDC = spell.requiresSave ? Int.random(in: 13...18) : 0
        let attackBonus = spell.requiresAttackRoll ? Int.random(in: 4...8) : 0

        return Relic(
            name: "Relic of \(spell.name)",
            material: ["Obsidian", "Bone", "Ivory", "Steel"].randomElement()!,
            form: ["Ring", "Talisman", "Blade", "Orb"].randomElement()!,
            spell: spell.name,
            casterLevel: casterLevel,
            saveDC: saveDC,
            attackBonus: attackBonus,
            drawback: ["Draws shadows", "Glows with eerie light", "Causes nightmares"].randomElement()!,
            origin: ["Discovered in the Blight", "Traded in the Feywild", "Unearthed in a ruined temple"].randomElement()!
        )
    }
}


#Preview {
    RelicGeneratorView()
}
