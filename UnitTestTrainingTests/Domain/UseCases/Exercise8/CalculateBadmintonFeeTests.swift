//
//  CalculateBadmintonFeeTests.swift
//  UnitTestTrainingTests
//
//  Created by bui.van.hung on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculateBadmintonFeeTests: XCTestCase, CalculateBadmintonFee {
    
    // Test case 1
    // Tuổi: < 0
    // result error 0.0
    
    func testCase1() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2021/05/11".toDate(), age: -1)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }
    
    // Test case 2
    // Tuổi: > 120
    // result error 0.0
    
    func testCase2() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2021/05/11".toDate(), age: 121)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 0.0)
    }
    
    // Test case 3
    // Tuổi: (0-13)
    // result 900
    
    func testCase3() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/11".toDate(), age: 10)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 900.0)
    }
    
    // Test case 4
    // Ngày chơi: Thứ 3
    // Tuổi: (13-65)
    // result 1200
    
    func testCase4() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/11".toDate(), age: 50)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }
    
    // Test case 5
    // Ngày chơi: Thứ 3
    // Tuổi: (65-120)
    // result 1200
    
    func testCase5() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/11".toDate(), age: 70)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1200.0)
    }

    // Test case 6
    // Tuổi: (13-65)
    // Ngày chơi: Thứ 6
    // Giới tính: Nữ
    // result 1400
    
    func testCase6() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/14".toDate(), age: 20)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    // Test case 7
    // Tuổi: (65-120)
    // Ngày chơi: Thứ 6
    // Giới tính: Nữ
    // result 1400
    
    func testCase7() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/14".toDate(), age: 70)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1400.0)
    }
    
    // Test case 8
    // Tuổi: (65-120)
    // Ngày chơi: Thứ 7
    // Giới tính: Nam
    // result 1600
    
    func testCase8() {
        let dto = BadmintonGameDto(isMale: true, playDate: "2021/05/15".toDate(), age: 70)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1600.0)
    }
    
    // Test case 9
    // Tuổi: (13-65)
    // Ngày chơi: Thứ 7
    // Giới tính: Nữ
    // result 1800
    
    func testCase9() {
        let dto = BadmintonGameDto(isMale: false, playDate: "2021/05/15".toDate(), age: 20)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, 1800.0)
    }
}
