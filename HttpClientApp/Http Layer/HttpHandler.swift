//
//  HttpHandler.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import Foundation


enum HTTPError : Error {
    
    case invalidHttpResponse
    case invalidEndPoint
    case nilData
}

enum HttpResult <T,Error> {
    case Success(T)
    case failure(Error)
}


typealias ResultCallBack<T: Decodable> = (HttpResult<T , Error>) -> Void

protocol HttpProtocol {
    
    func makeRequest(withUrl url: URL) -> URLRequest
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type , callBack: (HttpResult<T, Error>) -> Void)
    func executeRequest<T: Decodable>(withRequest request: URLRequest) async throws -> T?
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
    
    
    func executeRequest<T: Decodable>(withRequest request: URLRequest,andResponseType responsetype: T.Type, callBack: @escaping (HttpResult<T?, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { resData, response, error in
            
            if let _response = response as? HTTPURLResponse {
                if (200...299).contains(_response.statusCode) {
                    
                    callBack(.Success(nil))
                }else {
                    callBack(.failure(HTTPError.invalidHttpResponse))
                }
            }
        }
        task.resume()
        
    }
    
    
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type) async throws -> T? {
        
        do {
             
            let (responseData, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                throw HTTPError.invalidHttpResponse
            }
            
            let result = try JSONDecoder().decode(responsetype.self, from: responseData)
            return result
            
            
        }catch {
            throw error
        }
        
    }
    
}
