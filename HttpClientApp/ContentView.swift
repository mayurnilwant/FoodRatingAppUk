//
//  ContentView.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        
        Task {
            do {
                let _ = try await RegionService().getAllRegions()
                print("Name")
            }catch {
                    print(error.localizedDescription)
                
            }
        }
        
        
        
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
