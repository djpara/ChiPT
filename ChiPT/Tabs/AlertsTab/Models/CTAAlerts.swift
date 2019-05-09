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
    
    // MARK: - Properties
    
    var CTARoutes: CTARoutes?
}

// MARK: - Api Protocol extension

extension CTAAlerts: ApiProtocol {
    
    // MARK: - Typealiases
    
    typealias Model = CTAAlerts
    
}
