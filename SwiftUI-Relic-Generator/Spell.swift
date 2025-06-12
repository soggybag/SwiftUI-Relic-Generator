//
//  Spell.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import Foundation

struct Spell: Codable, Identifiable {
    var id: String { name }

    let name: String
    let level: Int
    let requiresSave: Bool
    let requiresAttackRoll: Bool
    let castAtHigherLevel: Bool
}


