//
//  Extensions.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 28/09/2022.
//

import Foundation


extension Dictionary {
    
    //Session.Request.Headers.Add("Accept-Language", "cy-GB");
    // Session.Request.Headers.Add("x-api-version", 2);
    
    static var HeaderDictionary : [String: String]
    {
        get {
            ["Accept-Language": "cy-GB",
             "x-api-version": "2"]
        }
    }
    
}
