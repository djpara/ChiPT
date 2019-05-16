//
//  CTAAlertsDownloadOperation.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Class

class CTAAlertsDownloadOperation<Alerts: ApiProtocol>: DownloadOperation {
    
    // MARK: - Enums
    
    enum AlertsId: String {
        case routeid = "routeid", stationid = "stationid"
    }
    
    enum AlertsType: String {
        case bus = "bus", rail = "rail", station = "station", systemwide = "systemwide"
    }
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        
        apiUrl = ApiURL(url: "http://www.transitchicago.com/api/1.0/routes.aspx")
    }
    
    convenience init(_ alertsParameter: AlertsId, value: String) {
        self.init()
        
        apiUrl?.addQueryItem(key: alertsParameter.rawValue, value: value)
    }
    
    convenience init(_ alertsTypes: [(type: AlertsType, value: String)]) {
        self.init()
        
        alertsTypes.forEach {
            apiUrl?.addQueryItem(key: $0.type.rawValue, value: $0.value)
        }
    }
    
    convenience init(completion: @escaping (Decodable?) -> Void) {
        self.init()
        addDownloadCompletionBlock(completion)
    }
    
    // MARK: - Override Instance Functions
    
    override func main() {
        guard !isCancelled else {
            print("Operation is cancelled")
            return
        }
        
        guard let completion = onDownloadCompletion else {
            print("Completion block required to make a network request")
            return
        }
        
        apiUrl?.addQueryItem(key: "OutputType", value: "JSON")
        
        guard let apiUrlRequest = apiUrl?.request else {
            print("Invalid api url request")
            return
        }
        
        CTAAlertsNetworkManager<Alerts>.load(apiUrlRequest, withCompletion: completion)
    }
    
}
