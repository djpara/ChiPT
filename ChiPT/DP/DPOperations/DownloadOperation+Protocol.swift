//
//  DownloadOperation.swift
//  ChiPT
//
//  Created by David Para on 5/9/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: Class

class DownloadOperation: Operation {
    
    private var _apiUrl: ApiURL?
    private var _completionBlock: ((Decodable?) -> Void)?
    
    convenience init(completion: @escaping (Decodable?) -> Void) {
        
        self.init()
        addDownloadCompletionBlock(completion) // Function appends nil setter to completion to remove retain cycle
    }
    
}

// MARK: Download Operation extension

extension DownloadOperation {
    
    // Instance Variables
    
    var apiUrl: ApiURL? {
        get { return _apiUrl }
        set { _apiUrl = newValue }
    }
    
    var onDownloadCompletion: ((Decodable?) -> Void)? {
        get { return _completionBlock }
    }
    
    // Instance Functions
    
    func addDownloadCompletionBlock(_ completion: @escaping (Decodable?) -> Void) {
        
        let modifiedCompletionBlock: (Decodable?) -> Void = { model in
            completion(model)
            self._completionBlock = nil
        }
        
        _completionBlock = modifiedCompletionBlock
    }
    
}
