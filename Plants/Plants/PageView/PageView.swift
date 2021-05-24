//
//  PageView.swift
//  Plants
//
//  Created by Seema Pandey on 22/03/21.
//

import SwiftUI

struct PageView<Page:View>: View {
    var pages:[Page]
    @State private var currentPage = 1
    var body: some View {
        ZStack(alignment: .bottom) {
        PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count > 2 ? 2 : pages.count, currentPage: $currentPage)
                            .frame(width: CGFloat(pages.count * 18))
        }
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView(pages: [PreviousScanCard(previousScans: PreviousScan(username: "Seema", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "loki", age: "31")), PreviousScanCard(previousScans: PreviousScan(username: "Rutvi", age: "3"))])
//    }
//}
