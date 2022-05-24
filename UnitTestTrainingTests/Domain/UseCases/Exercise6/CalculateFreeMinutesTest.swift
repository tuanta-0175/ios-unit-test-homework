//
//  CalculateFreeMinutesTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class CalculateFreeMinutesTest: XCTestCase, CalculatingFreeMinutes {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_validateMoneyAmount() {
        let result = self.validateMoneyAmount("100")
        XCTAssertEqual(result.isValid, true)
        XCTAssertEqual(result.message, "")
    }
    
    func test_watchingMovie_totalBillGeater5000() {
        let dto = TayHoOrderDto(moneySpent: "5050", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 300)
    }
    
    func test_watchingMovie_totalBillGeater2000() {
        let dto = TayHoOrderDto(moneySpent: "2000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 240)
    }
    
    func test_watchingMovie_totalBillLess2000() {
        let dto = TayHoOrderDto(moneySpent: "1500", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 180)
    }
    
    func test_noWatchingMovie_totalBillGeater5000() {
        let dto = TayHoOrderDto(moneySpent: "5050", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 120)
    }
    
    func test_noWatchingMovie_totalBillGeater2000() {
        let dto = TayHoOrderDto(moneySpent: "2000", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 60)
    }
    
    func test_noWatchingMovie_totalBillLess2000() {
        let dto = TayHoOrderDto(moneySpent: "1500", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        XCTAssertEqual(result, 0)
    }
    
}
