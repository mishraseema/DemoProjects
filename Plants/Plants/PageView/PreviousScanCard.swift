//
//  PreviousScanCard.swift
//  Plants
//
//  Created by Seema Pandey on 22/03/21.
//

import SwiftUI

struct PreviousScan {
    let username:String
    let age:String
    
}

struct PreviousScanCard: View {
    let previousScans:PreviousScan
    
    var body: some View {
        VStack{
        Text(previousScans.username)
            Text(previousScans.age)
        }.background(Color.blue)
        
    }
}

struct PreviousScanCard_Previews: PreviewProvider {
    static var previews: some View {
        PreviousScanCard(pages: [PreviousScanCard(previousScans: PreviousScan(username: "Seema", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "loki", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "Rutvi", age: "3"))])
    }
}
