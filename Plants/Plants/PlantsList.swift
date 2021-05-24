//
//  PlantsList.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import SwiftUI

struct PlantsList: View {
    var body: some View {
        NavigationView {
            List(plants){
                curr_plant in
                NavigationLink(destination:PlantDetail(plantDetail: curr_plant)){
                    PlantRow(plant: curr_plant).frame(height:60)
                }
            }.navigationTitle(Text("Plants"))
        }
    }
}

struct PlantsList_Previews: PreviewProvider {
    static var previews: some View {
        PlantsList()
    }
}
