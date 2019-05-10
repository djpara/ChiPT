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
    
    enum RoutesParameter: String {
        case type = "type", routeid = "routeid", stationid = "stationid"
    }
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        
        baseUrl = "http://www.transitchicago.com/api/1.0/routes.aspx"
        url = "\(baseUrl)?OutputType=JSON"
    }
    
    convenience init(_ routesParameter: RoutesParameter, value: String) {
        self.init()
        
        let parameter = "\(routesParameter.rawValue)=\(value)"        
        url = "\(baseUrl)?\(parameter)&OutputType=JSON" // Override base initializer's reference setting
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
        
        guard let url = URL(string: url) else {
            print("Invalid url")
            return
        }
        
        guard let completion = onDownloadCompletion else {
            print("Completion block required to make a network request")
            return
        }
        
        CTAAlertsNetworkManager<Alerts>.load(url, withCompletion: completion)
    }
    
}
