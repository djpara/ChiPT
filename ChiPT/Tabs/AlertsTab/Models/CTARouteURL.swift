//
//  CTARouteURL.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Struct

struct CTARouteURL: Decodable {
    
    // MARK: - Instance Properties
    
    var CDataSection: String?
    
    // MARK: - Initializers
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        CDataSection = try container.decodeIfPresent(String.self, forKey: .CDataSection)
    }
}

// MARK: - Fileprivate enum

fileprivate enum CodingKeys: String, CodingKey {
    case CDataSection = "#cdata-section"
}
