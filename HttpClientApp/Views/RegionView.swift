//
//  RegionView.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import SwiftUI
import Combine


struct Item : Identifiable {
    
    var id =  UUID()
    var name = "Mayur"
}

struct RegionView : View {

    @State private var isLoading: Bool = false
    @ObservedObject var regionVM : RegionViewModel
    var listItems = [Item]()
    
    
    init(withViewModel regionVM: RegionViewModel) {
        self.regionVM = regionVM
        //self.listItems = [Item(),Item(),Item(),Item(),Item(),Item(),Item()]
    }
    var body: some View {
        
        ZStack {
            List{
                ForEach(self.regionVM.items, id: \.id) { region in
                    Text("\(region.name)")
                }
            }
            if #available(iOS 14.0, *) {
                if self.isLoading {
                    LoadingIndicatorView()
                    
                }
                
            } else {
                // Fallback on earlier versions
            }
          
                
        }
        .onAppear {
                self.getRegionList()
           
        }
    }
    
    
     private func getRegionList() {
        Task {
            do {
                self.isLoading.toggle()
                    try await self.regionVM.getListItems()
                    self.isLoading.toggle()
                
            }catch {
                
            }
        }
    }
}

struct LoadingIndicatorView: View {
    var body: some View {
        ZStack {
            Color(UIColor.gray)
                .opacity(0.3)
            if #available(iOS 14.0, *) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.0)
                    .ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
