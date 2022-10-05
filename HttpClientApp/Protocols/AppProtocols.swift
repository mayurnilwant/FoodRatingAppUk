//
//  AppProtocols.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation
import SwiftUI


 
//protocol Loadableview where Self : View { 
//    
//    var isLoading: Bool{get}
//}

protocol ListableViewmodel: AnyObject {
    
    func getListItems() async throws
}


protocol Servicable {
    associatedtype item
    func getAllItems() async throws -> [Authority]
    func getResult(byid id: String) -> item
    
}
