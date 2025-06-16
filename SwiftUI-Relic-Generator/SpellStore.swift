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

@MainActor func generateRelic(from spells: [Spell]) -> Relic {
//  guard let spell = spells.randomElement() else {
//    fatalError("No spells loaded.")
//  }
  
  let spell = weightedSpell(from: spells)
  
  let form = SpellStore.forms.randomElement()!.capitalized
  let material = SpellStore.materials.randomElement()!.capitalized
  let adjective = SpellStore.adjectives.randomElement()!
  let noun = SpellStore.nouns.randomElement()!

  let template = SpellStore.nameTemplates.randomElement()!
  let name = template(spell, form, material, adjective, noun)
  
  let drawback = themedDrawback(for: spell)
  let origin = themedOrigin(for: spell)

  let casterLevel = max(spell.level * 2, Int.random(in: spell.level...spell.level + 5))
  let saveDC = spell.requiresSave ? Int.random(in: 13...18) : 0
  let attackBonus = spell.requiresAttackRoll ? Int.random(in: 4...8) : 0
  
  return Relic(
    name: name,
    material: material,
    form: form,
    spell: spell.name,
    casterLevel: casterLevel,
    saveDC: saveDC,
    attackBonus: attackBonus,
    drawback: drawback,
    origin: origin
  )
  
  func weightedSpell(from spells: [Spell]) -> Spell {
    // Create a bias: more copies of lower-level spells
    var weighted: [Spell] = []
    for spell in spells {
      let weight = max(1, 10 - spell.level * 2) // e.g. 0 → weight 10, 5 → weight 0
      weighted.append(contentsOf: Array(repeating: spell, count: weight))
    }
    return weighted.randomElement()!
  }
  
  func randomCasterLevel(for spell: Spell) -> Int {
    let minCasterLevel = spell.level == 0 ? 1 : spell.level * 2 // or 1.5?
    let upper = minCasterLevel + 4
    return Int.random(in: minCasterLevel...upper)
  }
  
  func themedDrawback(for spell: Spell) -> String {
      if spell.level >= 6 {
        return SpellStore.highLevelDrawbacks.randomElement()!
      } else if spell.requiresSave {
        return SpellStore.saveDrawbacks.randomElement()!
      } else if spell.requiresAttackRoll {
        return SpellStore.attackDrawbacks.randomElement()!
      } else {
        return SpellStore.lowLevelDrawbacks.randomElement()!
      }
  }

  func themedOrigin(for spell: Spell) -> String {
      if spell.level >= 7 {
        return SpellStore.rareOrigins.randomElement()!
      } else if spell.level >= 3 {
        return SpellStore.arcaneOrigins.randomElement()!
      } else {
        return SpellStore.simpleOrigins.randomElement()!
      }
  }

  
}

