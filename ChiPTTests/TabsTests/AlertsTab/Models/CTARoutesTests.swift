//
//  CTARoutesTests.swift
//  ChiPTTests
//
//  Created by David Para on 5/7/19.
//  Copyright © 2019 parad. All rights reserved.
//

import XCTest
@testable import ChiPT

class CTARoutesTests: XCTestCase {
    
    // MARK: - Private Instance Variables
    
    private var model: CTAAlerts?
    
    // MARK: - Override Instance Functions

    override func setUp() {
        do {
            guard let path = Bundle.main.path(forResource: "CTAAlerts", ofType: "json") else { return }
            let pathURL = URL(fileURLWithPath: path)
            let jsonData = try Data(contentsOf: pathURL, options: .mappedIfSafe)
            model = CTAAlerts.createModel(data: jsonData)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func tearDown() {
        model = nil
    }
    
    // MARK: - Instance Functions

    func testCTAAlertsModel() {
        
        if let errorCode = model?.CTARoutes?.ErrorCode?.compactMap({ $0 }) {
            XCTAssertTrue(errorCode == ["0", "0"])
        } else {
            XCTFail("Unable to read CTARoutes ErrorCode")
        }
        
        if let route = model?.CTARoutes?.RouteInfo?.first??.Route {
            XCTAssertTrue(route == "Red Line")
        } else {
            XCTFail("Unable to read CTARoutes RouteInfo")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
