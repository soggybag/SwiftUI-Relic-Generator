//
//  Relic.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import Foundation
import SwiftData

@Model
class Relic {
  var name: String
  var material: String
  var form: String
  var spell: String
  var casterLevel: Int
  var saveDC: Int
  var attackBonus: Int
  var drawback: String
  var origin: String
  var createdAt: Date
  var notes: String = ""
  
  init(name: String, material: String, form: String, spell: String, casterLevel: Int, saveDC: Int, attackBonus: Int, drawback: String, origin: String, notes: String = "") {
    self.name = name
    self.material = material
    self.form = form
    self.spell = spell
    self.casterLevel = casterLevel
    self.saveDC = saveDC
    self.attackBonus = attackBonus
    self.drawback = drawback
    self.origin = origin
    self.createdAt = .now
    self.notes = notes
  }
}


import Foundation

extension Relic {
  var shareText: String {
        """
        \(name)
        ----------------------
        Form: \(form)
        Material: \(material)
        Spell: \(spell)
        Caster Level: \(casterLevel)
        Save DC: \(saveDC)
        Attack Bonus: +\(attackBonus)
        Drawback: \(drawback)
        Origin: \(origin)
        Notes: \(notes)
        """
  }
  
  var shareMarkdown: String {
        """
        ## \(name)
        
        **Form:** \(form)  
        **Material:** \(material)  
        **Spell:** `\(spell)`  
        **Caster Level:** \(casterLevel)  
        **Save DC:** \(saveDC)  
        **Attack Bonus:** +\(attackBonus)  
        
        **Drawback:** _\(drawback)_  
        **Origin:** _\(origin)_  
        
        **Notes:**  
        \(notes)
        """
  }
}

