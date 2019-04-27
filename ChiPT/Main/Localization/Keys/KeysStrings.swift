//
//  KeysStrings.swift
//  ChiPT
//
//  Created by David Para on 4/27/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation

enum KeysStrings: String, Localizable {
    
    case ctaApiKey = "cta_api_key"
    
    var tableName: String {
        return "Keys"
    }
}
