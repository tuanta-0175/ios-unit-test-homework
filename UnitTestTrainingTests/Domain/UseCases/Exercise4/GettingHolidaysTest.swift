//
//  GettingHolidaysTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class GettingHolidaysTest: XCTestCase, GettingHolidays {
    var dateGateway: DateGatewayType {
        return dateGateWayMock
    }

    private var dateGateWayMock: DateGatewayMock!
    
    override func setUp() {
        super.setUp()
        dateGateWayMock = DateGatewayMock()
    }
    
    func test_getHiliday() {
        let result = dateGateWayMock.getHolidays()
        XCTAssert(self.dateGateWayMock.getHolidaysCalled)
        XCTAssertNotNil(result)
    }
    
    
}
