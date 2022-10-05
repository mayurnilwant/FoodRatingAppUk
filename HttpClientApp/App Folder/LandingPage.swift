//
//  ContentView.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import SwiftUI

struct LandingPageView: View {
    @State private var isLoading = false
    
    init() {}
        
    
    var body: some View {
        
        
        TabView {
            RegionView(withViewModel: RegionViewModel())
                .tabItem {
                    if #available(iOS 14.0, *) {
                        Label("Region", systemImage: "globe.americas.fill")
                    } else {
                        // Fallback on earlier versions
                    }
                }
            
            AuthorityView(withAuthViewModel: AuthorityViewModel(withAuthorityService: AuthorityService()))
                .tabItem {
                    if #available(iOS 14.0, *) {
                        Label("Authorities", systemImage: "network.badge.shield.half.filled")
                    } else {
                        // Fallback on earlier versions
                    }
                }
                
        }.accentColor(.red)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
