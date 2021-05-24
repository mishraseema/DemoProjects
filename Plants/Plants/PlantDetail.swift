//
//  ContentView.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import SwiftUI

struct PlantDetail: View {
    var plantDetail:Plant
    var body: some View {
        VStack{
            Image("c").resizable().aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
            Image(plantDetail.imageName)
                .frame(width: 180, height: 180)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .foregroundColor(.white)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .offset(x: 0, y: -90)
                .padding(.bottom, -90)
                .shadow(radius: 10)
                
            Text(plantDetail.name).font(.system(size:20)).fontWeight(.medium)
            StatText(statName: "Plant Type:", statvalue: plantDetail.type)
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct PlantDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetail(plantDetail: plants[0])
    }
}
