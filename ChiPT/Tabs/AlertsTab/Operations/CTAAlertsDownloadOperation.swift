//
//  CTAAlertsDownloadOperation.swift
//  ChiPT
//
//  Created by David Para on 4/28/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Main Class

class CTAAlertsDownloadOperation: Operation {
    
    // MARK: - Enums
    
    enum RoutesParameters: String {
        case type = "type", routeid = "routeid", stationid = "stationid"
    }
    
    // MARK: - Private Static Variables
    
    private let _baseUrl = "http://www.transitchicago.com/api/1.0/routes.aspx"
    private let _toJson = "OutputType=JSON"
    private var _url: String
    
    private var _completionBlock: ((Decodable?) -> Void)?
    
    // MARK: - Initializers
    
    override init() {
        
        _url = "\(_baseUrl)?\(_toJson)"
        super.init()
    }
    
    convenience init(_ routesParameter: RoutesParameters, value: String) {
        
        let parameter = "\(routesParameter.rawValue)=\(value)"
        
        self.init()
        _url = "\(_baseUrl)?\(parameter)&\(_toJson)" // Override base initializer's reference setting
    }
    
    convenience init(completion: @escaping (Decodable?) -> Void) {
        
        self.init()
        addCompletionBlock(completion)
    }
    
    // MARK: - Override Instance Functions
    
    override func main() {
        guard !isCancelled else {
            print("Operation is cancelled")
            return
        }
        
        guard let url = URL(string: _url) else {
            print("Invalid url")
            return
        }
        
        guard let completion = _completionBlock else {
            print("Completion block required to make a network request")
            return
        }
        
        CTAAlertsNetworkManager.load(url, withCompletion: completion)
    }
    
}

// MARK: - Internal extension

extension CTAAlertsDownloadOperation {
    
    // Instance Functions
    
    func addCompletionBlock(_ completion: @escaping (Decodable?) -> Void) {
        
        let modifiedCompletionBlock: (Decodable?) -> Void = { model in
            completion(model)
            self._completionBlock = nil
        }
        
        _completionBlock = modifiedCompletionBlock
    }
    
}
