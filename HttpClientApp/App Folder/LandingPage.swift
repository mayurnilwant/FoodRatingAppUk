//
//  ContentView.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import SwiftUI

struct LandingPageView: View {
    
    init() {}
        
    
    var body: some View {
        
        
        TabView {
            RegionView(withViewModel: RegionViewModel())
                .tabItem {
                    Label("Region", systemImage: "globe.americas.fill")
                }
            
            AuthorityView(withAuthViewModel: AuthorityViewModel(withAuthorityService: AuthorityService()))
                .tabItem {
                    Label("Authorities", systemImage: "network.badge.shield.half.filled")
                }
                
        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
