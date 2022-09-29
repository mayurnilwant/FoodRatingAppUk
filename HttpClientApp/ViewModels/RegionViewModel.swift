//
//  RegionViewModel.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import Combine

 class RegionViewModel : ObservableObject {
    
    @Published var items = [Region]()
    
    init() {}
    
    @MainActor func getListItems() async throws {
        
            Task {
                self.items = try await RegionService().getAllRegions()?.regions ?? [Region]()
            }
        
    }
    
    
    
}
