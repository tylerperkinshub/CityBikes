//
//  NetworkDetail.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/17/22.
//

import Foundation
import CoreData


struct Networks: Decodable {
    var networks: [BikesNetworkProperties] = []
    
    enum RootKeys: String, CodingKey {
        case networks
    }
}

public struct BikesNetworkProperties: Decodable {
    
    var city: String = ""
    var country: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var company: [String] = []
    var name: String = ""
    var id: String = ""
    
    enum CodingKeys: String, CodingKey {
        case location
        case company
        case name
        case id
    }
    
    enum LocationKeys: String, CodingKey {
        case city
        case country
        case latitude
        case longitude
    }
    
}

extension BikesNetworkProperties {
    public init(from decoder: Decoder) throws {
        
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        name = try values!.decode(String.self, forKey: .name)
        id = try values!.decode(String.self, forKey: .id)
            
        do {
            if let companyString = try values!.decode(Optional<[String]>.self, forKey: .company){
                company = companyString
            }
        } catch {
            
            let newValue = try values!.decode(String.self, forKey: .company)
            company.append(newValue)
        }
        
        if let locationContainer = try values?.nestedContainer(keyedBy: LocationKeys.self, forKey: .location) {
            city = try! locationContainer.decode(String.self, forKey: .city)
            latitude = try! locationContainer.decode(Double.self, forKey: .latitude)
            longitude = try! locationContainer.decode(Double.self, forKey: .longitude)
            country = try! locationContainer.decode(String.self, forKey: .country)
        }
    }
}
