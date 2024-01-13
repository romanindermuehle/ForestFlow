//
//  RateValueAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI

struct RateValueAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var rateValues: [RateValue] = []
    @State var volume: Float = 0.0
    @State var stage: Int = -1
    
    
    var body: some View {
        VStack {
            Form {
                Section("Tarif") {
                    TextField("Tarif", text: $name)
                }
                
                Section("Stufen") {
                    ForEach(rateValues, id: \.self) { rateValue in
                        HStack {
                            Text("\(rateValue.stage)")
                            Stepper("Volume: \(rateValue.volume)", onIncrement: {
                                volume += 0.1
                            }, onDecrement: {
                                volume -= 0.1
                            })
                        }
                    }
                    AddButton()
                        .button {
                            stage += 1
                            rateValues.append(RateValue(stage: stage, volume: volume))
                        }
                }
            }
            Spacer()

            Text("Anlegen")
                .font(.Bold.title2)
                .foregroundStyle(Color.accentColor)
                .padding()
                .button {
                    self.saveRateType()
                }
            
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    func saveRateType() {
        let rateType = RateType(name: name)
        context.insert(rateType)
        print(rateType.rateValues)
        dismiss()
    }
}