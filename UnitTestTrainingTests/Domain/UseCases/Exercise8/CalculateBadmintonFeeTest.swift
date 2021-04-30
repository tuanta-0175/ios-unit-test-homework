//
//  CalculateBadmintonFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by Nguyen The Vinh on 4/30/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateBadmintonFeeTest: XCTestCase, CalculateBadmintonFee {

    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 7)
        return formatter.date(from: string) ?? Date()
    }

    override func setUp() {
        super.setUp()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_children_nomalDay() {
        let date = createDayWith(string: "2021/04/26 15:00:00")
        let dto = BadmintonGameDto(age: "12", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(900))
    }

    func test_children_tuesday() {
        let date = createDayWith(string: "2021/04/27 15:00:00")
        let dto = BadmintonGameDto(age: "12", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(900))
    }

    func test_children_FriDay() {
        let date = createDayWith(string: "2021/04/30 15:00:00")
        let dto = BadmintonGameDto(age: "12", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(900))
    }

    func test_adult_male_nomalDay() {
        let date = createDayWith(string: "2021/04/26 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1800))
    }

    func test_adult_male_tuesday() {
        let date = createDayWith(string: "2021/04/27 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1200))
    }

    func test_adult_male_friday() {
        let date = createDayWith(string: "2021/04/30 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1800))
    }

    func test_adult_female_nomalDay() {
        let date = createDayWith(string: "2021/04/26 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1800))
    }

    func test_adult_female_tuesday() {
        let date = createDayWith(string: "2021/04/27 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1200))
    }

    func test_adult_female_friday() {
        let date = createDayWith(string: "2021/04/30 15:00:00")
        let dto = BadmintonGameDto(age: "30", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1400))
    }

    func test_elder_female_normalday() {
        let date = createDayWith(string: "2021/04/26 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1600))
    }

    func test_elder_female_tuesday() {
        let date = createDayWith(string: "2021/04/27 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1200))
    }

    func test_elder_female_friday() {
        let date = createDayWith(string: "2021/04/30 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: false, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1400))
    }

    func test_elder_male_normalday() {
        let date = createDayWith(string: "2021/04/26 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1600))
    }

    func test_elder_male_tuesday() {
        let date = createDayWith(string: "2021/04/27 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1200))
    }

    func test_elder_male_friday() {
        let date = createDayWith(string: "2021/04/30 15:00:00")
        let dto = BadmintonGameDto(age: "66", isMale: true, playDate: date)
        let result = self.calculatePlayFee(dto: dto)
        XCTAssertEqual(result, Double(1600))
    }

}
