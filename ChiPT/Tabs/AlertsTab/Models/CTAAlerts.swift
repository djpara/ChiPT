//
//  CTAAlerts.swift
//  ChiPT
//
//  Created by David Para on 5/7/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Struct

struct CTAAlerts: Decodable {
    
    var CTARoutes: CTARoutes?
}

// MARK: - Api Protocol extension

extension CTAAlerts: ApiProtocol {
    
    typealias Model = CTAAlerts
}

// MARK: - Secondary Struct

struct CTAAlerts_RouteId: Decodable {
    
    var CTARoutes: CTARoutes_RouteId?
}

// MARK: - Api Protocol extension

extension CTAAlerts_RouteId: ApiProtocol {
    
    typealias Model = CTAAlerts_RouteId
}
