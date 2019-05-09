//
//  CTARouteInfo.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Struct

struct CTARouteInfo: Decodable {
    
    // MARK: - Properties
    
    var Route: String?
    var RouteColorCode: String?
    var RouteTextColor: String?
    var ServiceId: String?
    var RouteURL: CTARouteURL?
    var RouteStatus: String?
    var RouteStatusColor: String?
}
