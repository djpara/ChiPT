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
    private var _alerts: CTAAlerts?
    private var _alertsWithRouteId: CTAAlerts_RouteId?

    override func setUp() {
        _downloadExpectation = expectation(description: "Downloding Data")
        _operationQueue = NetworkOperationQueue.QoS(.default).queue
    }

    override func tearDown() {
        _alerts = nil
        _alertsWithRouteId = nil
    }

    func testAllCTAAlertsDownload() {

        let operation = CTAAlertsDownloadOperation<CTAAlerts>(completion: getAllAlertsCompletion())
        _operationQueue.addOperation(operation)
        
        waitForExpectations(timeout: 15, handler: nil)
        
        guard let firstRoute = _alerts?.CTARoutes?.RouteInfo?.first??.Route else {
            XCTFail()
            return
        }
    
        print(firstRoute)
        XCTAssertTrue(firstRoute == "Red Line")
    }
    
    func test78AlertDownload() {
        
        let operation = CTAAlertsDownloadOperation<CTAAlerts_RouteId>(.routeid, value: "78")
        operation.addDownloadCompletionBlock(getBlueLineCompletion())
        _operationQueue.addOperation(operation)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        guard let firstRoute = _alertsWithRouteId?.CTARoutes?.RouteInfo?.Route else {
            XCTFail()
            return
        }
        
        print(firstRoute)
        XCTAssertTrue(firstRoute == "Montrose")
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
    
    private func getBlueLineCompletion() -> ((Decodable?) -> Void) {
        
        let function: (Decodable?) -> Void =  { model in
            
            guard let model = model as? CTAAlerts_RouteId else {
                XCTFail()
                return
            }
            
            self._alertsWithRouteId = model
            
            self._downloadExpectation.fulfill()
        }
        
        return function
    }

}
