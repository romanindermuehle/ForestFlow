//
//  WoodTypeEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct WoodTypeModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var woodType: WoodType?
    @State var name: String
    
    let isEditing: Bool
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            
            Button {
                saveWoodType()
            } label: {
                Text("Anlegen")
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
            
        }
        .padding()
    }
    
    func saveWoodType() {
        if isEditing {
            woodType?.name = name
        } else {
            let woodType = WoodType(name: name)
            context.insert(woodType)
        }
        dismiss()
    }
}
