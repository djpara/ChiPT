//
//  CTAAlertsDownloadOperation.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

class CTAAlertsDownloadOperation: Operation {
    
    // MARK: - Enums
    
    enum RoutesParameters: String {
        case type = "type", routeid = "routeid", stationid = "stationid"
    }
    
    // MARK: - Private Static Variables
    
    private static let _operationQueue = OperationQueue()
    
    private let _baseUrl = "http://www.transitchicago.com/api/1.0/routes.aspx"
    private let _toJson = "OutputType=JSON"
    private var _url: String
    
    private var _completionBlock: (()->CTARoutes)?
    
    // MARK: - Initializers
    
    override init() {
        
        _url = "\(_baseUrl)?\(_toJson)"
        super.init()
    }
    
    convenience init(_ routesParameter: RoutesParameters, value: String) {
        
        let parameter = "\(routesParameter.rawValue)=\(value)"
        
        self.init()
        _url = "\(_baseUrl)?\(parameter)&\(_toJson)"
    }
    
    // MARK: - Override Instance Functions
    
    override func main() {
//        <#code#>
    }
    
    // MARK: - Private Instance Functions
    
    private func addCompletionBlock(_ completion: @escaping ()->CTARoutes) {
        _completionBlock = completion
    }
    
}

// MARK: - Internal extension

extension CTAAlertsDownloadOperation {
    
    // Variables
    static var operationQueue: OperationQueue {
        get { return _operationQueue }
    }
    
}
