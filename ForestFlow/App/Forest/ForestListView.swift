//
//  ForestListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct ForestListView: View {
    @Query private var forests: [Forest]

    var body: some View {
        NavigationStack {
            List {
                ForEach(forests, id: \.self) { forest in
                    NavigationLink(value: forest) {
                        ForestCell(forest: forest)
                    }
                }
            }
            .navigationTitle("Waldliste")
            .overlay(alignment: .bottomTrailing) {
                NavigationLink(destination: ForestAddView()) {
                    PlusButton()
                }
            }
            .navigationDestination(for: Forest.self) { forest in
                ForestDetailView(forest: forest)
            }
        }
    }
}

#Preview {
    ForestListView()
}
