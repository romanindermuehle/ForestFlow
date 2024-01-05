//
//  Forest.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import Foundation
import SwiftData

@Model
class Forest {
    var name: String
    var location: String
    var forestOwner: ForestOwner?
    var rateType: RateType? // TarifEnum
    var cropLoss: Int
    @Relationship(deleteRule: .cascade, inverse: \Tree.forest) var trees: [Tree]

    init(
        name: String,
        location: String,
        forestOwner: ForestOwner? = nil,
        rateType: RateType? = nil,
        cropLoss: Int,
        trees: [Tree] = []
    ) {
        self.name = name
        self.location = location
        self.forestOwner = forestOwner
        self.rateType = rateType
        self.cropLoss = cropLoss
        self.trees = trees
    }
}
