//
//  ListBeerModel.swift
//  BeerList
//
//  Created by Gabriel on 30/01/24.
//

import Foundation

struct ListBeerModel: Codable {
    let id: Int?
    let name: String?
    let tagline: String?
    let imageUrl: String?
    
    init(id: Int?, name: String?, tagline: String?, imageUrl: String?) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.imageUrl = imageUrl
    }
    
    enum listBeerKey: String, CodingKey {
        case id
        case name
        case tagline
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: listBeerKey.self)
        let id: Int? = try container.decodeIfPresent(Int.self, forKey: .id)
        let name: String? = try container.decodeIfPresent(String.self, forKey: .name)
        let tagline: String? = try container.decodeIfPresent(String.self, forKey: .tagline)
        let imageUrl: String? = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        self.init(id: id, name: name, tagline: tagline, imageUrl: imageUrl)
    }
}
