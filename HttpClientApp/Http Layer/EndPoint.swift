//
//  EndPoint.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import Foundation


struct EndPoint {
    private let scheme: String
    private let host: String
    var queryDictionary : [String: Any]?
    var path: String?
    
    private init () {
        self.scheme = "https"
        self.host = "abc.com"
    }
    
    init(withPath path: String, andQueryItems qItems: [String: Any]? = nil) {
        self.init()
        self.path = path
        guard let _items = qItems else {
            return
        }
        self.queryDictionary = _items
        
    }
    
}


extension EndPoint {
    
    var generatedUrl : URL? {
        
        var urlComponent = URLComponents()
        urlComponent.scheme = self.scheme
        urlComponent.host = self.host
        if let _path = self.path {
            urlComponent.path = "/" + _path
        }
        if let _queryItems = self.queryDictionary {
            urlComponent.queryItems = _queryItems.map({ key, value in
                
                return URLQueryItem(name: key, value: "\(value)")
            })
        }
        return urlComponent.url
    }
}


