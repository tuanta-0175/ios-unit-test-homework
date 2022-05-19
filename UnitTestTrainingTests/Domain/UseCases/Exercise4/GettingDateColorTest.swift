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
    
    func test_RedColor() {
        var holidays = [Date()]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let holiday = formatter.date(from: "2022/01/01")
        holidays.append(holiday!)
        
        let dto = GetDateColorDto(date: Date(), holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    func test_BlueColor() {
        let holidays: [Date] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "2022/05/21")!
        
        let dto = GetDateColorDto(date: date, holidays: holidays)
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.blue)
    }
    
    func test_BlackColor() {
        let holidays: [Date] = []
        let dto = GetDateColorDto(date: Date(), holidays: holidays)
        
        let result = self.getDateColor(dto: dto)
        
        XCTAssertEqual(result, UIColor.black)
    }
}
