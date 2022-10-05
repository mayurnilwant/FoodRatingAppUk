//
//  LoadingActivityView.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 05/10/2022.
//

import Foundation
import SwiftUI


struct ActiviIndicatorLoadingView: UIViewRepresentable {
    
    @Binding var loading: Bool
    let style: UIActivityIndicatorView.Style
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        loading ? uiView.startAnimating() :  uiView.stopAnimating()
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        activityIndicatorView.backgroundColor = UIColor.gray
        return activityIndicatorView
    }
    
    typealias UIViewType = UIActivityIndicatorView
    

}


struct LoadingIndicatorView: View {
    @Binding var  loading: Bool
    
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
                ActiviIndicatorLoadingView(loading: $loading, style: .medium)

            }
        }
    }
}
