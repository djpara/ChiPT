//
//  CTAAlertsNetworkManager.swift
//  ChiPT
//
//  Created by David Para on 5/9/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Struct

struct CTAAlertsNetworkManager<Alerts: ApiProtocol> { }

// MARK: - Network Manager extension

extension CTAAlertsNetworkManager: NetworkManager {
    
    typealias Model = Alerts
}
