//
//  PlantModel.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import Foundation
import SwiftUI

struct Plant:Identifiable {
    var id: String
    let name:String
    let type:String
    let imageName:String
}


let plants = [
    Plant(id: "1", name: "XYZ", type: "In-door", imageName: "b"),
    Plant(id: "2", name: "ABC", type: "Out-door", imageName: "c")
]
