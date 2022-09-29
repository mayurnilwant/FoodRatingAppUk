//
//  AppProtocols.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
//

import Foundation


protocol Servicable {
    associatedtype item
    func getAllItems() async throws -> [Authority]
    func getResult(byid id: String) -> item
    
}
