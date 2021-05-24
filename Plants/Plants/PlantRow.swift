//
//  PlantRow.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import SwiftUI

struct PlantRow: View {
    var plant:Plant
    var body: some View {
        HStack {
            Image(plant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .background(Circle())
                .foregroundColor(.black)
            Text(plant.name)
            Spacer()
        }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var previews: some View {
        PlantRow(plant: plants[0]).previewLayout(.fixed(width: 500, height: 100))
    }
}
