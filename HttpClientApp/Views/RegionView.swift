//
//  RegionView.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import SwiftUI
import Combine


struct RegionView : View {

    @State private var loading: Bool = false
    @ObservedObject var regionVM : RegionViewModel
    
    
    init(withViewModel regionVM: RegionViewModel) {
        self.regionVM = regionVM
        //self.listItems = [Item(),Item(),Item(),Item(),Item(),Item(),Item()]
    }
    var body: some View {
        
        ZStack {
            List{
                ForEach(self.regionVM.items, id: \.id) { region in
                    Text("\(region.name)")
                }
            }
                if self.loading {
                    LoadingIndicatorView(loading: $loading)
                }
                
            
          
                
        }
        .onAppear {
                self.getRegionList()
           
        }
    }
    
    
     private func getRegionList() {
        Task {
            do {
                self.loading.toggle()
                    try await self.regionVM.getListItems()
                    self.loading.toggle()
                
            }catch {
                
            }
        }
    }
}


