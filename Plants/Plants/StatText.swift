//
//  StatText.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import SwiftUI

struct StatText: View {
    var statName:String
    var statvalue:String
    var body: some View {
        HStack{
            Text(statName)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.leading)
            Text(statvalue)
                .font(.system(size: 20))
                .fontWeight(.light)
                .padding(.trailing)
           
        }
    }
}

struct StatText_Previews: PreviewProvider {
    static var previews: some View {
        StatText(statName: "Plant Type", statvalue: "Indoor")
    }
}
