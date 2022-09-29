//
//  RegionViewModel.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation


class RegionViewModel : ListableViewmodel, ObservableObject {
    
    @Published var items: [Region]?
    
    
    init() {}
    
    
    func getListItems() async throws {
        
        do  {
            self.items? = try await RegionService().getAllRegions()?.regions ?? [Region]()
            
        }catch {
            print(error)
        }
        
    }
    
    
    
}
