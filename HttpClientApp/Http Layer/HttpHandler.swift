//
//  HttpHandler.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import Foundation

enum HttpResult <T,Error> {
    case Success(T)
    case failure(Error)
}


typealias ResultCallBack<T: Decodable> = (HttpResult<T , Error>) -> Void

protocol HttpProtocol {
    
    func makeRequest(withUrl url: URL) -> URLRequest
    func executeRequest()
    
}


extension HttpProtocol {
    
    func makeRequest(withUrl url: URL, andHeaderDictionary _dictionary: [String: String]? = nil) -> URLRequest {
        
        var urlRequest = URLRequest(url: url)
        
        if let hDictionary = _dictionary {
            hDictionary.forEach { key, value in
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return urlRequest
    }
}
