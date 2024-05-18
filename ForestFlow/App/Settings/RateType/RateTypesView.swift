//
//  RateTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI
import SwiftData

struct RateTypesView: View {
    @Query var rateTypes: [RateType]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            if rateTypes.isEmpty {
                ContentUnavailableView(
                    "Noch keine Tarife angelegt",
                    systemImage: "eurosign.arrow.circlepath" ,
                    description: Text("Erstelle einen neuen Tarif indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(rateTypes, id: \.self) { rateType in
                        NavigationLink(value: rateType) {
                            Text(rateType.name)
                        }
                        .swipeActions {
                            Button {
                                if rateType.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    context.delete(rateType)
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(rateType.canDelete() != nil ? .gray : .red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Tarife")
        .navigationDestination(for: RateType.self) { rateType in
            RateTypeModifyView(rateType: .constant(rateType), name: rateType.name, rateValues: rateType.rateValues ?? [], isEditing: true)
        }
        .navigationDestination(for: Bool.self) { _ in
            RateTypeModifyView(rateType: .constant(nil), name: "", rateValues: [], isEditing: false)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: true) {
                    Image(systemName: "plus")
                }
            }
        }
        .alert("Löschen nicht möglich", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Dieses Element kann nicht gelöscht werden, da es in verwendung ist")
        }
    }
}


