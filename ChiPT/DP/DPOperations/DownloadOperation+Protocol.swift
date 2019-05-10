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
    
    private var _baseUrl = ""
    private var _url = ""
    private var _completionBlock: ((Decodable?) -> Void)?
    
    convenience init(completion: @escaping (Decodable?) -> Void) {
        
        self.init()
        addDownloadCompletionBlock(completion) // Function appends nil setter to completion to remove retain cycle
    }
    
}

// MARK: Download Operation extension

extension DownloadOperation {
    
    // Instance Variables
    
    var baseUrl: String {
        get { return _baseUrl }
        set { _baseUrl = newValue }
    }
    
    var url: String {
        get { return _url }
        set { _url = newValue }
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
