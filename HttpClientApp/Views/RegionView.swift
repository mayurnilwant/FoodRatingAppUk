//
//  RegionView.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import SwiftUI
import Combine


struct Item : Identifiable {
    
    var id =  UUID()
    var name = "Mayur"
}

struct RegionView : View {

    @ObservedObject var regionVM : RegionViewModel
    var listItems = [Item]()
    
    
    
    init(withViewModel regionVM: RegionViewModel) {
        self.regionVM = regionVM
        //self.listItems = [Item(),Item(),Item(),Item(),Item(),Item(),Item()]
    }
    var body: some View {
        
            List{
                ForEach(self.regionVM.items, id: \.id) { region in
                    Text("\(region.name)")
                }
            }
            .onAppear {
                Task {
                    do {
                        try await self.regionVM.getListItems()
                    }catch {
                        
                    }
                }
                
            }
    }
    
    
}
