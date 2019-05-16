//
//  URL+Extension.swift
//  ChiPT
//
//  Created by David Para on 5/15/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

struct ApiURL {
    
    // MARK: - Instance Instance Variables
    
    var url: URL
    var urlComponents: URLComponents?
    var request: URLRequest {
        get {
            let requestUrl = urlComponents?.url ?? url
            return URLRequest(url: requestUrl)
        }
    }
    
    // MARK: - Initializers
    
    init?(url: String) {
        guard let url = URL(string: url) else { return nil }
        self.url = url
    }
    
    // MARK: - Mutating Instance Functions
    
    mutating func addQueryItem(key: String, value: String) {
        // Create urlComponents if needed
        if urlComponents == nil { urlComponents = URLComponents(string: url.absoluteString) }
        // Create query items if needed
        if urlComponents!.queryItems == nil { urlComponents!.queryItems = [URLQueryItem]() }
        // Add new query items
        urlComponents?.queryItems?.append(URLQueryItem(name: key, value: value))
    }
    
}
