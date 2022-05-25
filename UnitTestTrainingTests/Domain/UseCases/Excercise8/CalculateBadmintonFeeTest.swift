//
//  CalculateBadmintonFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateBadmintonFeeTest: XCTestCase, CalculateBadmintonFee {
    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: string) ?? Date()
    }
    
    func test_ageLess0() {
        let dto = BadmintonGameDto(age: "-8", isMale: false, playDate: Date())
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 0.0)
    }
    
    func test_age0To12() {
        let dto = BadmintonGameDto(age: "10", isMale: false, playDate: Date())
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 900.0)
    }
    
    func test_age13To64_otherFriday() {
        let date = createDayWith(string: "2022/05/27")
        let dto = BadmintonGameDto(age: "60", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1800.0)
    }

    func test_age13To64_male_friday() {
        let date = createDayWith(string: "2022/05/27")
        let dto = BadmintonGameDto(age: "60", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1800.0)
    }

    func test_age13To64_female_friday() {
        let date = createDayWith(string: "2022/05/27")
        let dto = BadmintonGameDto(age: "60", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1400.0)
    }
    
    func test_age65To120_male_friday() {
        let dto = BadmintonGameDto(age: "100", isMale: false, playDate: Date())
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1600.0)
    }
    
    func test_age65To120_female_friday() {
        let date = createDayWith(string: "2022/05/27")
        let dto = BadmintonGameDto(age: "60", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1400.0)
    }
    
    func test_ageMore120() {
        let dto = BadmintonGameDto(age: "121", isMale: false, playDate: Date())
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 0.0)
    }
    
    func test_age0To12_tuesday() {
        let date = createDayWith(string: "2022/05/24")
        let dto = BadmintonGameDto(age: "10", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 900.0)
    }
    
    func test_age13To64_tuesday() {
        let date = createDayWith(string: "2022/05/24")
        let dto = BadmintonGameDto(age: "60", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1200.0)
    }
    
    func test_age65To120_tuesday() {
        let date = createDayWith(string: "2022/05/24")
        let dto = BadmintonGameDto(age: "100", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)

        XCTAssertEqual(result, 1200.0)
    }
}
