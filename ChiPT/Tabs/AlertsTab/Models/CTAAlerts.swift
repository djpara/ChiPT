//
//  CTAAlerts.swift
//  ChiPT
//
//  Created by David Para on 5/7/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

struct CTAAlerts: Decodable {
    var CTARoutes: CTARoutes?
}

// MARK: - ApiProtocol

extension CTAAlerts: ApiProtocol {
    
    // MARK: - Typealiases
    
    typealias Model = CTAAlerts
    
}
