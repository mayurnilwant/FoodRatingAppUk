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
    @State var loading: Bool = false
    
    init(withAuthViewModel vModel : AuthorityViewModel) {
        self.authVM = vModel
    }
    var body: some View {
        
        ActivityIndicatorContainerView(withBinding: $loading, andThemeColor: .red) {
            NavigationView {
                List( content: {
                    
                    ForEach(self.authVM.items) { authority in
                        Text(authority.name)
                    }
                })
                
                .onAppear {
                    self.loadAuthorities()
                }
            }
        }
        
    }
    
    private func loadAuthorities() {
        
        Task {
            self.loading.toggle()
            try await self.authVM.getAllItems()
            self.loading.toggle()
            
        }
    }
}
    
