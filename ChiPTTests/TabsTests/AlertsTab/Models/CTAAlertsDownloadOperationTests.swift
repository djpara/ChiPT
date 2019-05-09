//
//  CTAAlertsDownloadOperationTests.swift
//  ChiPTTests
//
//  Created by David Para on 5/9/19.
//  Copyright © 2019 parad. All rights reserved.
//

import XCTest
@testable import ChiPT

class CTAAlertsDownloadOperationTests: XCTestCase {
    
    private var _downloadExpectation: XCTestExpectation!
    private var _operationQueue: OperationQueue!
    private var _operation: CTAAlertsDownloadOperation!
    private var _alerts: CTAAlerts?

    override func setUp() {
        _downloadExpectation = expectation(description: "Downloding Data")
        _operationQueue = NetworkOperationQueue.QoS(.default).queue
    }

    override func tearDown() {
        _operation = nil
        _alerts = nil
    }

    func testAllCTAAlertsDownload() {

        _operation = CTAAlertsDownloadOperation(completion: getAllAlertsCompletion())
        _operationQueue.addOperation(_operation)
        
        waitForExpectations(timeout: 15, handler: nil)
        
        guard let firstRoute = _alerts?.CTARoutes?.RouteInfo?.first??.Route else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(firstRoute == "Red Line")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Private Instance Functions
    
    private func getAllAlertsCompletion() -> ((Decodable?) -> Void) {
        
        let function: (Decodable?) -> Void = { model in
            
            guard let model = model as? CTAAlerts else {
                XCTFail()
                return
            }
            
            self._alerts = model
            
            self._downloadExpectation.fulfill()
        }
        
        return function
    }

}
