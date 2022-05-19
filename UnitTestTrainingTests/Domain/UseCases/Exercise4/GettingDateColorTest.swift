//
//  GettingDateColorTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class GettingDateColorTest: XCTestCase, GettingDateColor, GettingHolidays {
    var dateGateway: DateGatewayType {
        return dateGatewayMock
    }
    
    private var dateGatewayMock: DateGatewayMock!

    override func setUp() {
        super.setUp()
        
        dateGatewayMock = DateGatewayMock()
    }
    
    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: string) ?? Date()
    }
    
    func test_isHolidays() {
        let dto = GetDateColorDto(date: self.getHolidays()[0], holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_notHolidays_sunday() {
        let date = createDayWith(string: "2022/05/22")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .red)
    }
    
    func test_notHolidays_saturday() {
        let date = createDayWith(string: "2022/05/21")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .blue)
    }
    
    func test_notHolidays_normalDay() {
        let date = createDayWith(string: "2022/05/20")
        let dto = GetDateColorDto(date: date, holidays: self.getHolidays())
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, .black)
    }
}
