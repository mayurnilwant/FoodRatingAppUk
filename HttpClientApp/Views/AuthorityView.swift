//
//  AuthorityView.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import SwiftUI


struct AuthorityView : View {
    
    @ObservedObject var authVM: AuthorityViewModel
    
    init(withAuthViewModel vModel : AuthorityViewModel) {
        self.authVM = vModel
    }
    var body: some View {
        
        NavigationView {
            List( content: {
                
                ForEach(self.authVM.items) { authority in
                    Text(authority.name)
                }
            })
            
            .onAppear {
                Task {
                    try await self.authVM.getAllItems()
                    
                }
            }
        }
      
        
        
    }
}
