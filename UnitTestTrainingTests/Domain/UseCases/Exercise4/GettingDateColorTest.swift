//
//  GettingDateColorTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class GettingDateColorTest: XCTestCase, GettingDateColor {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_dateColor_notHoliday_isSunday() {
        let holidays: [Date] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/22")!
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    func test_dateColor_notHoliday_isSaturday() {
        let holidays: [Date] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/21")!
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.blue)
    }
    
    func test_dateColor_notHoliday_isNormal() {
        let holidays: [Date] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/19")!

        let dto = GetDateColorDto(date: date, holidays: holidays)
        
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.black)
    }
    
    func test_dateColor_holiday_isSaturday() {
        var holidays = [Date()]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/01/01")!
        holidays.append(date)
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    func test_dateColor_holiday_isNormal() {
        var holidays = [Date()]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let holiday = formatter.date(from: "2022/09/02")!
        holidays.append(holiday)
        let date = formatter.date(from: "2022/05/19")!
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
        
    }
    func test_dateColor_holiday_isSunday() {
        var holidays = [Date()]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/01")!
        holidays.append(date)
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.red)
    }
}
