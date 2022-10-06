//
//  AuthorityViewModel.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation


class AuthorityViewModel: ObservableObject {
    
    @Published var items = [Authority]()
    var authServiceHandler: AuthorityService
    
    init(withAuthorityService serviceHandler: AuthorityService) {
        self.authServiceHandler = serviceHandler
    }
    
     @MainActor func getAllItems() async throws  {
        
            
                self.items = try await self.authServiceHandler.getAllItems()
            
    }
}
