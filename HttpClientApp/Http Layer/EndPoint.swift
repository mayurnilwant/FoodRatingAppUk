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
        self.host = ProjectEnviornment.productionBaseUrl.rawValue
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
            urlComponent.path = _path
        }
        if let _queryItems = self.queryDictionary {
            urlComponent.queryItems = _queryItems.map({ key, value in
                
                return URLQueryItem(name: key, value: "\(value)")
            })
        }
        //https://api.ratings.food.gov.uk/regions?
        //https://api.ratings.food.gov.uk/regions
        print("Generated url:\( String(describing: urlComponent.url))")
        return urlComponent.url
    }
}



extension EndPoint {
    
    static func getAllRegionEndPoint() -> Self {
        EndPoint(withPath: "/regions")
        
    }
}
