//
//  CalculateBadmintonFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.cong.anh on 29/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculateBadmintonFeeTests: XCTestCase, CalculateBadmintonFee {
    
    override func setUp() {
        super.setUp()
    }

    func test_validateAge_success() {
        let result = self.validateAge("30")
        XCTAssert(result.isValid)
    }
    
    func test_validateAge_error_larger_range() {
        let result = self.validateAge("121")
        XCTAssertFalse(result.isValid)
    }
    
    func test_validateAge_error_smaller_range() {
        let result = self.validateAge("-1")
        XCTAssertFalse(result.isValid)
    }
    
    func test_validateAge_error_format() {
        let result = self.validateAge("aaa")
        XCTAssertFalse(result.isValid)
    }
    
    /// Test case basic
    /// Age: 5
    /// Date: Monday (2021/05/03)
    /// Gender: Male
    func test_calculateFee_basic_success() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2021/05/03".toDate(),
                                   age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    /// Test case basic for chidren
    /// Age: 5
    /// Date: Monday (2021/05/03)
    /// Gender: Male
    func test_calculateFee_basic_for_chidren() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2021/05/03".toDate(),
                                   age: 5)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    /// Test case basic 65 year old
    /// Age: 65
    /// Date: Monday (2021/05/03)
    /// Gender: Male
    func test_calculateFee_basic_65_year_old() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2021/05/03".toDate(),
                                   age: 65)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    /// Test case basic for older
    /// Age: 66
    /// Date: Monday (2021/05/03)
    /// Gender: Male
    func test_calculateFee_for_older() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2021/05/03".toDate(),
                                   age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1600.0)
    }
    
    /// Test case basic for women
    /// Age: 25
    /// Date: Monday (2021/05/03)
    /// Gender: Female
    func test_calculateFee_basic_for_women() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/03".toDate(),
                                   age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
    
    /// Test case sale for women
    /// Age: 25
    /// Date: Monday (2021/05/07)
    /// Gender: Female
    func test_calculateFee_sale_for_women() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/07".toDate(),
                                   age: 25)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }

    /// Test case sale for women older
    /// Age: 66
    /// Date: Monday (2021/05/07)
    /// Gender: Female
    func test_calculateFee_sale_for_women_older() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/07".toDate(),
                                   age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    /// Test case for Thusday for older
    /// Age: 66
    /// Date: Monday (2021/05/04)
    /// Gender: Female
    func test_calculateFee_for_older_thusday() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/04".toDate(),
                                   age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    /// Test case for Thusday
    /// Age: 26
    /// Date: Monday (2021/05/04)
    /// Gender: Female
    func test_calculateFee__thusday() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/04".toDate(),
                                   age: 26)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    /// Test case for Thusday for chidren
    /// Age: 5
    /// Date: Monday (2021/05/04)
    /// Gender: Female
    func test_calculateFee_for_chidren_thusday() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2021/05/04".toDate(),
                                   age: 66)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
}
