//
//  RegionsService.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 28/09/2022.
//

import Foundation



class RegionService: HttpServicable {
    
    func getAllRegions() async throws -> Regions? {
        let regionEndPointUrl = EndPoint.getAllRegionEndPoint()
        
        guard let url = regionEndPointUrl.generatedUrl else {
            throw HTTPError.invalidEndPoint
        }
        let request =  self.makeRequest(withUrl: url, andHttpMethod: .get, andHeaderDictionary: Dictionary<String,String>.HeaderDictionary)
        return try await self.executeRequest(withRequest: request, andResponseType: Regions.self)
    }
    
}


class AuthorityService: HttpServicable,Servicable {

    func getAllItems() async throws -> [Authority] {
        let authorityEndPoint = EndPoint.getAllAuthoritiesEndPoint()
        guard let _url = authorityEndPoint.generatedUrl else {
            throw HTTPError.invalidEndPoint
        }
        let request = self.makeRequest(withUrl: _url, andHttpMethod: .get, andHeaderDictionary: Dictionary<String, String>.HeaderDictionary)
        do {
            let authorities = try await self.executeRequest(withRequest: request, andResponseType: Authorities.self)
            return authorities?.authorities ?? [Authority]()
        }catch {
            print(error)
        }
        return [Authority]()
    }
    
    func getResult(byid id: String) -> Authority {
     
        return Authority()
    }
    
    
    typealias item = Authority
    
    
    
}
