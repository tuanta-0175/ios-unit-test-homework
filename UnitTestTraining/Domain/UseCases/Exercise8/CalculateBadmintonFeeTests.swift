//
//  CalculateBadmintonFeeTests.swift
//  UnitTestTraining
//
//  Created by trinh.giang.dong on 10/05/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Foundation

final class CalculateBadmintonFeeTests: XCTestCase, CalculateBadmintonFee {

    override func setUp() {
        super.setUp()
    }

    // Test case 1
    /// Age: -1
    /// Date: Mon
    /// Male: YES
    func test_calculateFee1() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/14".toDate(), age: -1)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }
    
    // Test case 2
    /// Age: 5
    /// Date: Mon
    /// Male: YES
    func test_calculateFee2() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/07".toDate(), age: 5)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    // Test case 3
    /// Age: 16
    /// Date: Mon
    /// Male: YES
    func test_calculateFee3() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/21".toDate(), age: 16)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    // Test case 4
    /// Age: 65
    /// Date: Mon
    /// Male: YES
    func test_calculateFee4() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/21".toDate(), age: 65)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    // Test case 5
    /// Age: 66
    /// Date: Mon
    /// Male: YES
    func test_calculateFee5() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/14".toDate(), age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1600.0)
    }
    
    // Test case 6
    /// Age: 30
    /// Date: Fri
    /// Male: FALSE
    func test_calculateFee6() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/18".toDate(), age: 30)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    // Test case 7
    /// Age: 9
    /// Date: Fri
    /// Male: FALSE
    func test_calculateFee7() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/18".toDate(), age: 9)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    // Test case 8
    /// Age: 66
    /// Date: Fri
    /// Male: FALSE
    func test_calculateFee8() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/25".toDate(), age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    // Test case 9
    /// Age: 66
    /// Date: Tue
    /// Male: FALSE
    func test_calculateFee9() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/15".toDate(), age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    // Test case 10
    /// Age: 66
    /// Date: Tue
    /// Male: FALSE
    func test_calculateFee10() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/22".toDate(), age: 8)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    // Test case 11
    /// Age: 14
    /// Date: Tue
    /// Male: FALSE
    func test_calculateFee11() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/22".toDate(), age: 14)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    // Test case 12
    /// Age: 121
    /// Date: Tue
    /// Male: FALSE
    func test_calculateFee12() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2020/09/15".toDate(), age: 121)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }

    // Test case 13
    /// Tuổi: 100
    /// Ngày chơi: Thứ 3
    /// Giới tính: Nam
    
    // Test case 13
    /// Age: 100
    /// Date: Tue
    /// Male: YES
    func test_calculateFee13() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2020/09/22".toDate(), age: 100)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }

    func test_validateAge_success() {
        let result = self.validateAge("30")
        XCTAssert(result.isValid)
    }

    func test_validateAge_failed() {
        let result = self.validateAge("130")
        XCTAssertFalse(result.isValid)
    }

    func test_validateAge_failed_NaN() {
        let result = self.validateAge("test invalidate string")
        XCTAssertFalse(result.isValid)
    }
}
