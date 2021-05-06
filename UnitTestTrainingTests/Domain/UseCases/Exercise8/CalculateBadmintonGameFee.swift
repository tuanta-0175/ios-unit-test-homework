//
//  CalculateBadmintonGameFee.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 06/05/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculateBadmintonGameFee: XCTest, CalculateBadmintonFee {
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: test case calculate Play Fee
    // test case 1:
    /// age < 0
    /// date: normal day
    /// isMale: true
    func test_case1() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: -1)
        
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(result, 0.0)
    }
    
    // test case 2:
    /// age = 0
    /// date: normal day
    /// isMale: true
    func test_case2() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 0)
        
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(result, 0.0)
    }
    
    // test case 3:
    /// age  > 120
    /// date: normal day
    /// isMale: true
    func test_case3() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 121)
        
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(result, 0.0)
    }
    
    // test case 4:
    /// age = 120
    /// date: normal day
    /// isMale: true
    func test_case4() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 120)
        
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(result, 0.0)
    }
    
    // test case 5:
    /// age < 13
    /// date: normal day
    /// isMale: true
    func test_case5() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 1)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 900.0)
    }
    
    // test case 6:
    /// age = 13
    /// date: normal day
    /// isMale: true
    func test_case6() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 13)
        
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(result, 1800.0)
    }

    // test case 7:
    /// age > 13 && age <= 65
    /// date: normal day
    /// isMale: true
    func test_case7() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 14)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1800.0)
    }
    
    // test case 8:
    /// age = 65
    /// date: normal day
    /// isMale: true
    func test_case8() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 65)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1800.0)
    }
    
    // test case 9:
    /// age > 65
    /// date: normal day
    /// isMale: true
    func test_case9() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/06".toDate(),
                                   age: 66)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1600.0)
    }
    
    // test case 10:
    /// any age
    /// date: Tuesday
    /// isMale: true/ false
    func test_case10() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/04".toDate(),
                                   age: 21)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1200.0)
    }
    
    // test case 11:
    /// any < 13
    /// date: Tuesday
    /// isMale: true/ false
    func test_case11() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/04".toDate(),
                                   age: 11)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 900.0)
    }
    
    // test case 12:
    /// any age
    /// date: Tuesday
    /// isMale: true/ false
    func test_case12() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/04".toDate(),
                                   age: 21)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1200.0)
    }
    
    // test case 13:
    /// any > 65
    /// date: Tuesday
    /// isMale: true/ false
    func test_case13() {
        let dto = BadmintonGameDto(isMale: true,
                                   playDate: "2020/05/04".toDate(),
                                   age: 66)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1200.0)
    }
    
    // test case 14:
    /// any > 13
    /// date: Friday
    /// isMale:  false
    func test_case14() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2020/05/07".toDate(),
                                   age: 21)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1400.0)
    }
    
    // test case 15:
    /// any < 13
    /// date: Friday
    /// isMale: false
    func test_case15() {
        let dto = BadmintonGameDto(isMale: false,
                                   playDate: "2020/05/07".toDate(),
                                   age: 11)

        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 900.0)
    }
    
    // MARK: Test validate Age
    func test_case_validate_success() {
        let result = self.validateAge("20")
        
        XCTAssert(result.isValid)
    }
    
    func test_case_validate_failed() {
        let result = self.validateAge("0")
        
        XCTAssertFalse(result.isValid)
    }
    
    func test_case_validate_failed_unwrapped() {
        let result = self.validateAge("string")
        
        XCTAssertFalse(result.isValid)
    }
}
