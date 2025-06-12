//
//  RelicDetailView.swift
//  SwiftUI-Relic-Generator
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

struct RelicDetailView: View {
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
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}


#Preview {
  RelicDetailView(relic: Relic(name: "Test", material: "Paper", form: "Letter", spell: "Charm Person", casterLevel: 1, saveDC: 3, attackBonus: 0, drawback: "None", origin: "Library of Leng"))
}
