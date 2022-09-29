//
//  ContentView.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import SwiftUI

struct LandingPageView: View {
    
    init() {
        
        Task {
            do {
//                let regions = try await RegionService().getAllRegions()
//                print("\(String(describing: regions))")
                let authorities = try await AuthorityService().getAllItems()
                print("\(String(describing: authorities))")
            }catch {
                    print(error.localizedDescription)
            }
        }
        
    }
    var body: some View {
        
        
        TabView {
            RegionView()
                .tabItem {
                    Label("Region", systemImage: "globe.americas.fill")
                }
            
            AuthorityView()
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
