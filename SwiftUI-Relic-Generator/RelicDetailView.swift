//
//  RelicDetailView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

struct RelicDetailView: View {
  @Binding var notes: String
  
  let relic: Relic
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(relic.name)
        .font(.title2)
        .bold()
      
      Text("Form: \(relic.form)")
      Text("Material: \(relic.material)")
      Text("Effect: Casts \(relic.spell)")
      Text("Level \(relic.casterLevel) | Save DC \(relic.saveDC) | Attack +\(relic.attackBonus)")
      Text("Drawback: \(relic.drawback)")
      Text("Origin: \(relic.origin)")
      Text("Notes:")
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      TextEditor(text: $notes)
        .frame(height: 100)
        .padding(8)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray.opacity(0.4))
        )
      
      HStack {
        ShareLink(item: relic.shareText) {
            Label("Share", systemImage: "square.and.arrow.up")
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(.tint)
        .cornerRadius(8)
        .labelStyle(.titleAndIcon)
      }
      .buttonStyle(.bordered)
      .background()
      .padding(.top)
      Spacer()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .background(Color(.secondarySystemBackground))
    .cornerRadius(12)
  }
}


#Preview {
    RelicDetailView(
      notes: .constant("Some Notes"),
        relic: Relic(
        name: "Test",
        material: "Paper",
        form: "Letter",
        spell: "Charm Person",
        casterLevel: 1,
        saveDC: 3,
        attackBonus: 0,
        drawback: "None",
        origin: "Library of Leng",
        notes: "Some Notes"
      )
    )
}


//Relic of Antimagic Field
//----------------------
//Form: Orb
//Material: Obsidian
//Spell: Antimagic Field
//Caster Level: 16
//Save DC: 0
//Attack Bonus: +0
//Drawback: Causes nightmares
//Origin: Discovered in the Blight
//Notes:


//Relic of Antimagic Field
//----------------------
//Form: Orb
//Material: Obsidian
//Spell: Antimagic Field
//Caster Level: 16
//Save DC: 0
//Attack Bonus: +0
//Drawback: Causes nightmares
//Origin: Discovered in the Blight
//Notes:
