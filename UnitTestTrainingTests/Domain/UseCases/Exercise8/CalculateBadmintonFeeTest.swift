//
//  CalculateBadmintonFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest


final class CalculateBadmintonFeeTest: XCTestCase, CalculateBadmintonFee {
    
    override class func setUp() {
        super.setUp()
    }
    
    func test_isErrorAge() {
        let dtoLessZero = BadmintonGameDto(age: "", isMale: true, playDate: Date())
        let dtoGreater120 = BadmintonGameDto(age: "121", isMale: true, playDate: Date())
        let resultLessZero = self.calculatePlayFee(dto: dtoLessZero)
        let resultGreater120 = self.calculatePlayFee(dto: dtoGreater120)
                                             
        XCTAssertNotNil(dtoLessZero.validationError)
        XCTAssertNotNil(dtoGreater120.validationError)
        XCTAssertEqual(0, resultLessZero)
        XCTAssertEqual(0, resultGreater120)
    }
    
    func test_aboutLess13() {
        let dto = BadmintonGameDto(age: "12", isMale: true, playDate: Date())
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(900, result)
    }
    
    func test_isTuesday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/24")!
        let dto = BadmintonGameDto(age: "25", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1200, result)
    }
    
    func test_about13_64_notSpecialDay() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/25")!
        let dto = BadmintonGameDto(age: "25", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1800, result)
    }
    
    func test_about13_64_isFemale_isFriday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/27")!
        let dto = BadmintonGameDto(age: "25", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1400, result)
    }
    
    func test_about13_64_isMale_isFriday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/27")!
        let dto = BadmintonGameDto(age: "25", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1800, result)
    }
    
    func test_about_greater65_120_notSpecialDay() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/25")!
        let dto = BadmintonGameDto(age: "66", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1600, result)
    }
    
    func test_about65_120_isFriday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/27")!
        let dto = BadmintonGameDto(age: "65", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        
        XCTAssertEqual(1400, result)
    }
}
