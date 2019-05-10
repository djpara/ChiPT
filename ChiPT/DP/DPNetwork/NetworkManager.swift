//
//  NetworkManager.swift
//  ChiPT
//
//  Created by David Para on 4/27/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: - Enum

enum NetworkOperationQueue {
    case main, QoS(QualityOfService)
    
    // MARK: Internal Properties
    
    var queue: OperationQueue {
        get { return getQueue() }
    }
    
    // MARK: Private Functions
    
    private func getQueue() -> OperationQueue {
        
        switch self {
        case .main:
            return OperationQueue.main
        case .QoS(let thread):
            let queue = OperationQueue()
            queue.qualityOfService = thread
            return queue
        }
        
    }
}

// MARK: - Protocol

protocol NetworkManager {
    associatedtype Model: ApiProtocol
    static func load(_ url: URL, withCompletion completion: @escaping (Decodable?) -> Void)
}

// MARK: - Network Manager extension

extension NetworkManager {
    
    var completionOperationQueue: OperationQueue {
        get { return OperationQueue() }
    }
    
    static func load(_ url: URL, withCompletion completion: @escaping (Decodable?) -> Void) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: NetworkOperationQueue.main.queue)
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("No Data")
                completion(nil)
                return
            }
            
            let model = Model.createModel(data: data)
            completion(model)
        }
        task.resume()
    }
}
