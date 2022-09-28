//
//  RegionsService.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 28/09/2022.
//

import Foundation

struct Region: Decodable {
    
    var id: Int
    var name: String
    var nameKey: String
    var code: String
}

struct Regions: Decodable {
    
    var regions : [Region]?
    
    enum CodingKeys: String, CodingKey {
        
        case regions = "regions"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try? decoder.container(keyedBy: CodingKeys.self)
            self.regions = try container?.decodeIfPresent([Region].self, forKey: .regions) ?? [Region]()
        }catch {
            print(error.localizedDescription)
        }
        
    }
}


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
