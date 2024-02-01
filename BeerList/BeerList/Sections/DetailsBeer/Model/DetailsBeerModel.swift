//
//  DetailsBeerModel.swift
//  BeerList
//
//  Created by Gabriel on 31/01/24.
//

import Foundation

struct DetailsBeerModel: Codable {
    let name: String?
    let tagline: String?
    let descriptions: String?
    let imageUrl: String?
    
    init(name: String?, tagline: String?,description: String?, imageUrl: String?) {
        self.name = name
        self.tagline = tagline
        self.descriptions = description
        self.imageUrl = imageUrl
    }
    
    enum DetailBeerKey: String, CodingKey {
        case name
        case tagline
        case descriptions = "description"
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailBeerKey.self)
        let name: String? = try container.decodeIfPresent(String.self, forKey: .name)
        let tagline: String? = try container.decodeIfPresent(String.self, forKey: .tagline)
        let description: String? = try container.decodeIfPresent(String.self, forKey: .descriptions)
        let imageUrl: String? = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        self.init(name: name, tagline: tagline, description: description, imageUrl: imageUrl)
    }
}
