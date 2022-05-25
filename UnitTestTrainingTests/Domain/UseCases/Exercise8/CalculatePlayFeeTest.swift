//
//  CalculatePlayFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

final class CalculatePlayFeeTest: XCTestCase, CalculateBadmintonFee {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_validateAge() {
        let result = ValidationResult.success(())
        XCTAssertEqual(result.isValid, true)
        XCTAssertEqual(result.message, "")
    }
    
    func test_ageLessZero() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date(), age: -1)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_ageGreater121() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date(), age: 121)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_ageFrom0To13() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date(), age: 10)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    func test_onTuesday() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date.createDayWith(string: "2022/05/24 10:10:00"), age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    func test_ageFrom13To64_exceptTuesdayAndFriday() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date.createDayWith(string: "2022/05/25 10:10:00"), age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    func test_ageFrom13To64_isFemale_onFriday() {
        let dto = BadmintonGameDto(isMale: false, playDate: Date.createDayWith(string: "2022/05/27 10:10:00"), age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    func test_ageFrom13To64_isMale_onFriday() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date.createDayWith(string: "2022/05/27 10:10:00"), age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    func test_ageFrom65To120_isFemale_onFriday() {
        let dto = BadmintonGameDto(isMale: false, playDate: Date.createDayWith(string: "2022/05/27 10:10:00"), age: 70)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    func test_ageFrom65To120_exceptTuesdayAndFriday() {
        let dto = BadmintonGameDto(isMale: true, playDate: Date.createDayWith(string: "2022/05/28 10:10:00"), age: 70)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1600.0)
    }
    
}
