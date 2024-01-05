//
//  SettingsView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 05.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink(destination: Text("Tarif")) {
                        Card(name: "Tarif", systemImage: "dollarsign.circle.fill")
                    }
                    NavigationLink(destination: Text("Waldbesitzer")) {
                        Card(name: "Waldbesitzer", systemImage: "person.text.rectangle.fill")
                    }
                }
                NavigationLink(destination: Text("Baumart")) {
                    Card(name: "Baumart", systemImage: "tree.circle.fill")
                }
                Spacer()
            }
            .padding(.top, 15)
            .navigationTitle("Einstellungen")
        }
    }
}

#Preview {
    SettingsView()
}
