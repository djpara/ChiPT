//
//  ApiProtocol.swift
//  ChiPT
//
//  Created by David Para on 5/7/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

// MARK: - Protocol

protocol ApiProtocol {
    associatedtype Model: Decodable
    static func createModel(data: Data) -> Model?
}

// MARK: - API Protocol extension

extension ApiProtocol {
    
    static func createModel(data: Data) -> Model? {
        
        do {
            return try JSONDecoder().decode(Model.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
        
    }
    
}
