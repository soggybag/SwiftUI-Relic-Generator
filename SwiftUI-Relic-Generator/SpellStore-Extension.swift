//
//  SpellStore-Extension.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/14/25.
//

import Foundation

extension SpellStore {
  static let materials = [
    "bone", "glass", "steel", "stone", "wood",
    "ivory", "crystal", "iron", "silver", "brass",
    "gold", "jade", "obsidian", "copper", "bronze"
  ]
  
  
  static let forms = [
    "ring", "pendant", "wand", "idol", "blade", "hammer",
    "torch", "charm", "tablet", "coin", "orb", "quill", "talisman",
    "finger", "hand", "claw", "eye", "brooch", "amulet", "ring", "vial"
  ]
  
  static let adjectives = [
    "Wyrm-bound", "Forgotten", "Whispering", "Shattered",
    "Soulburned", "Violet", "Hollow", "Ancient", "Sealed", "Luminous",
    "dry", "wet", "smoldering", "glowing", "pale", "bloody"
  ]
  
  static let nouns = [
    "Fang", "Veil", "Eye", "Crown", "Thorn",
    "Flame", "Echo", "Shard", "Curse", "Mirror",
    "dark", "light"
  ]
  
  static let drawbacks = [
    "Shatters when used",
    "Cursed dreams",
    "Glows at night",
    "Attracts the undead",
    "Burns the user slightly",
    "Whispers in unknown tongues",
    "Causes strange weather nearby",
    "Draws attention from Fey creatures",
    "Temporarily blinds the caster",
    "Leeches HP equal to spell level",
    "Causes random wild magic surge",
    "The wielder ages 1 year per use",
    "Cannot be used twice by the same person",
    "Triggers fear in allies nearby",
    "Summons a shadow with a grudge"
  ]
  
  static let origins = [
    "Forged in the Feywild",
    "Recovered from a lich’s hoard",
    "Traded in the Midnight Market",
    "Unearthed from a forgotten vault",
    "Crafted during a blood moon",
    "Discovered in a dream",
    "Gifted by a trickster god",
    "Summoned from the Shadow Realm",
    "Found at the bottom of a sunken ruin",
    "Stolen from the Library of Leng",
    "Passed down in a cursed noble line",
    "Buried beneath the city of bones",
    "Sold for a soul in a distant land",
    "Dropped from the heavens by accident",
    "Formed by accident during a ritual gone wrong"
  ]
  
  static let lowLevelDrawbacks = [
    "Shatters when used",
    "Glows at night",
    "The wielder hears faint whispers"
  ]
  
  static let highLevelDrawbacks = [
    "Leeches HP equal to spell level",
    "A shadowy echo of the caster appears nearby",
    "Draws attention from extraplanar beings"
  ]
  
  static let saveDrawbacks = [
    "Causes fear in nearby allies",
    "Backlash harms the caster if the target saves"
  ]
  
  static let attackDrawbacks = [
    "The relic sears the wielder’s hand",
    "Emits a loud crack that alerts enemies"
  ]
  
  static let simpleOrigins = [
      "Traded in the Midnight Market",
      "Found in a goblin hoard",
      "Dropped by a wandering peddler"
  ]

  static let rareOrigins = [
      "Recovered from a lich’s hoard",
      "Forged under a crimson eclipse",
      "Gifted by a forgotten god"
  ]

  static let arcaneOrigins = [
      "Conjured during a planar convergence",
      "Stolen from the vaults of Sigil",
      "Crafted by a wizard in exile"
  ]

}

extension SpellStore {
  static let nameTemplates: [(Spell, String, String, String, String) -> String] = [
    { _, form, _, adjective, noun in "\(form.capitalized) of the \(adjective) \(noun)" },
    { _, form, material, _, _ in "\(material.capitalized) \(form.capitalized)" },
    { spell, _, _, _, _ in "Relic of \(spell.name)" },
    { _, _, _, adjective, noun in "The \(adjective) \(noun)" }
  ]
}

