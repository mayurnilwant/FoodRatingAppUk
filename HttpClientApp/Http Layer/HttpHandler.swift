//
//  HttpHandler.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

import Foundation
import Combine



    
enum ProjectEnviornment : String {
    case productionBaseUrl = "api.ratings.food.gov.uk"
    case StaginBaseUrl = "api.ratings.food.gov.uk/staging"
    
}


enum HTTPError : Error {
    
    case invalidHttpResponse
    case invalidEndPoint
    case nilData
}

enum HttpResult<T,Error> {
    case success(T?)
    case failure(Error)
}


enum Httpmethod {
    case get
    case post(Data)
    
    func raw() -> String {
        
        switch self {
        case .get:
            return "get"
        case .post(_):
           return "post"
        }
    }
}

protocol HttpServicable {
    
    func makeRequest(withUrl url: URL, andHttpMethod method: Httpmethod, andHeaderDictionary _dictionary: [String: String]?) -> URLRequest
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type , callBack: @escaping (HttpResult<T, Error>) -> Void)
    //func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type) async throws -> T?
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type) async throws -> T?
}


extension HttpServicable {
    
    func makeRequest(withUrl url: URL, andHttpMethod method: Httpmethod, andHeaderDictionary _dictionary: [String: String]?) -> URLRequest{
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.raw()
        
        
        if let hDictionary = _dictionary {
            hDictionary.forEach { key, value in
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return urlRequest
    }
    
    
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type , callBack: @escaping (HttpResult<T, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { resData, response, error in
            
            guard let satatusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(satatusCode) else {
                callBack(.failure(HTTPError.invalidHttpResponse))
                return
            }
            
            let result = try? JSONDecoder().decode(responsetype.self, from: resData ?? Data())
            callBack(.success(result))
            
        }
        task.resume()
        
    }
    
    
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type) async throws -> T? {
        
        do {
            
            if #available(iOS 15.0, *) {
                let (responseData, response) = try await URLSession.shared.data(for: request, delegate: nil)
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                    throw HTTPError.invalidHttpResponse
                
                }
                let result = try  JSONDecoder().decode(responsetype.self, from: responseData)
                return result
            } else {
                
                let requestResult : T? = try await withCheckedThrowingContinuation({ continuation in
                    
                    self.executeRequest(withRequest: request, andResponseType: responsetype.self) { response in
                        switch response {
                            
                        case .success( let responseResult):
                            do {
                                continuation.resume(returning: responseResult)
                            }
                        case .failure(_):
                            continuation.resume(throwing: HTTPError.nilData)
                        }
                    }
                    
                })
                
                return requestResult
            }
        }catch {
            throw error
            }
            
        }
    
}
