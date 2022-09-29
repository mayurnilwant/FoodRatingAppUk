//
//  Regions.swift
//  FoodRatingAppUK
//
//  Created by Mayur Nilwant on 29/09/2022.
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

struct Authority: Decodable {
    
    var localAuthorityId  = 0
    var localAuthorityIdCode  = ""
    var name  = ""
    var friendlyName  = ""
    var url  = ""
    var email = ""
    
    
    enum Codingkeys: String, CodingKey {
        
        case localAuthorityId = "LocalAuthorityId"
        case localAuthorityIdCode = "LocalAuthorityIdCode"
        case name = "Name"
        case friendlyName = "FriendlyName"
        case url = "Url"
        case email = "Email"
    }
    init() {
        
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: Codingkeys.self)
            self.localAuthorityId = try container.decodeIfPresent(Int.self, forKey: Codingkeys.localAuthorityId) ?? 0
            self.localAuthorityIdCode = try container.decodeIfPresent(String.self, forKey: Codingkeys.localAuthorityIdCode) ?? ""
            self.name = try container.decodeIfPresent(String.self, forKey: Codingkeys.name) ?? ""
            self.friendlyName = try container.decodeIfPresent(String.self, forKey: Codingkeys.friendlyName) ?? ""
            self.url = try container.decodeIfPresent(String.self, forKey: Codingkeys.url) ?? ""
            self.email = try container.decodeIfPresent(String.self, forKey: Codingkeys.email) ?? ""
            
            
        }catch {
            print(error)
        }
        
        
    }

}

struct Authorities : Decodable {
    
    var authorities : [Authority]?
    
    
    enum CodingKeys: String, CodingKey {
        case authorities = "authorities"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authorities = try container.decodeIfPresent([Authority].self, forKey: CodingKeys.authorities) ?? [Authority]()
            
        }catch {
            print(error)
        }
    }
}
