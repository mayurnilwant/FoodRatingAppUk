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
    }
    var body: some View {
        
        ActivityContainerView(withBinding: $loading, andThemeColor: .gray) {
            ZStack {
                List{
                    ForEach(self.regionVM.items, id: \.id) { region in
                        Text("\(region.name)")
                    }
                }
            }
            .onAppear {
                    self.getRegionList()
            }
        }
        
    }
    
    
    private func getRegionList() {
        Task {
            do {
                self.loading.toggle()
                  let _ =  try await self.regionVM.getListItems()
                self.loading.toggle()
                
            }catch {
                print(error)
            }
        }
    }
}


