//
//  CTARoutes.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Struct

struct CTARoutes: Decodable {
    
    // MARK: - Properties
    
    var TimeStamp: String?
    var ErrorCode: [String?]?
    var ErrorMessage: [String?]?
    var RouteInfo: [CTARouteInfo?]?
}
