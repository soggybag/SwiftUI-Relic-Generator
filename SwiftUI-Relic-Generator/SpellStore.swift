//
//  SpellStore.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import Foundation

@MainActor
class SpellStore: ObservableObject {
    @Published var spells: [Spell] = []

    init() {
        self.spells = loadSpells()
    }

    private func loadSpells() -> [Spell] {
        guard let url = Bundle.main.url(forResource: "spells", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([Spell].self, from: data) else {
            print("⚠️ Failed to load spells.json")
            return []
        }
        return decoded
    }
}


func loadSpells() -> [Spell] {
    guard let url = Bundle.main.url(forResource: "spells", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let spells = try? JSONDecoder().decode([Spell].self, from: data) else {
        print("Failed to load or parse spells.json")
        return []
    }
    return spells
}

func generateRelic(from spells: [Spell]) -> Relic {
    guard let spell = spells.randomElement() else {
        fatalError("No spells loaded.")
    }

    let casterLevel = max(spell.level * 2, Int.random(in: spell.level...spell.level + 5))
    let saveDC = spell.requiresSave ? Int.random(in: 13...18) : 0
    let attackBonus = spell.requiresAttackRoll ? Int.random(in: 4...8) : 0

    return Relic(
        name: "Relic of \(spell.name)",
        material: ["Obsidian", "Iron", "Ivory", "Glass"].randomElement()!,
        form: ["Amulet", "Orb", "Wand", "Ring"].randomElement()!,
        spell: spell.name,
        casterLevel: casterLevel,
        saveDC: saveDC,
        attackBonus: attackBonus,
        drawback: ["Shatters when used", "Cursed dreams", "Glows at night"].randomElement()!,
        origin: ["Forged in the Feywild", "Recovered from a lich’s hoard", "Traded in the Midnight Market"].randomElement()!
    )
}

