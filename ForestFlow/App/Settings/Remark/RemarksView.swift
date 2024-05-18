//
//  RemarkAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct RemarksView: View {
    
    @Environment(\.modelContext) var context
    
    @State var showModifyView: Bool = false
    @State private var remark: Remark?
    
    // MARK: - Query
    @Query var remarks: [Remark]

    var body: some View {
        VStack {
            if remarks.isEmpty {
                ContentUnavailableView(
                    "Noch keine Bemerkung angelegt",
                    systemImage: "text.bubble.fill" ,
                    description: Text("Erstelle eine neue Bemerkung indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(remarks, id: \.self) { remark in
                        Button {
                            self.remark = remark
                        } label: {
                            Text(remark.name)
                                .font(.Bold.title)
                        }
                    }
                    .onDelete(perform: deleteModel)
                }
            }
        }
        .navigationTitle("Bemerkungen")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .sheet(item: $remark, onDismiss: { self.remark = nil }) { remark in
            RemarkModifyView(remark: $remark, name: remark.name, isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            RemarkModifyView(remark: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }
    
    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = remarks[index]
            context.delete(model)
        }
    }
}


