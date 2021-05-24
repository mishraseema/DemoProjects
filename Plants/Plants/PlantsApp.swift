//
//  PlantsApp.swift
//  Plants
//
//  Created by Seema Pandey on 11/02/21.
//

import SwiftUI

@main
struct PlantsApp: App {
    var body: some Scene {
        
        WindowGroup {
            //PlantsList()
//            PageViewController(pages: [PreviousScanCard(previousScans: PreviousScan(username: "Seema", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "loki", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "Rutvi", age: "3"))])
            PageView(pages: [PreviousScanCard(previousScans: PreviousScan(username: "Seema", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "loki", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "Rutvi", age: "3"))]) .aspectRatio(3 / 2, contentMode: .fit)
                .listRowInsets(EdgeInsets())
        }
    }
}
