//
//  GetDateColorTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class GetDateColorTest: XCTestCase, GettingDateColor, GettingHolidays {
    
    var dateGateway: DateGatewayType {
        return dateGatewayMock
    }
    
    private var dateGatewayMock: DateGatewayMock!
    
    override func setUp() {
        super.setUp()
        dateGatewayMock = DateGatewayMock()
    }
    
    func test_holiday_isSunday() {
        let date = Date.createDayWith(string: "2022/04/30 10:10:00")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_holiday_isSaturday() {
        let date = Date.createDayWith(string: "2022/04/30 10:10:00")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_holiday_isNormalDay() {
        let date = Date.createDayWith(string: "2022/04/30 10:10:00")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_notHoliday_isSunday() {
        let date = Date.createDayWith(string: "2022/05/15 15:15:15")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_notHoliday_isSaturday() {
        let date = Date.createDayWith(string: "2022/05/14 14:14:14")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .blue)
    }
    
    func test_notHoliday_isNormalDay() {
        let date = Date.createDayWith(string: "2022/05/18 18:18:18")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .black)
    }
    
}
