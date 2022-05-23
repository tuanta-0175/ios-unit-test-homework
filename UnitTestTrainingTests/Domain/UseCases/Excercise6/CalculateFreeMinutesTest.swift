//
//  CalculateFreeMinutesTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculatingFreeMinutesTest: XCTestCase, CalculatingFreeMinutes {
    func test_watchMovie_less2000() {
        let dto = TayHoOrderDto(moneySpent: "1000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 180)
    }
    
    func test_watchMovie_2000To5000() {
        let dto = TayHoOrderDto(moneySpent: "3000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 240)
    }
    
    func test_watchMovie_more5000() {
        let dto = TayHoOrderDto(moneySpent: "6000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 300)
    }
    
    func test_noWatchMovie_less2000() {
        let dto = TayHoOrderDto(moneySpent: "1000", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_noWatchMovie_2000To5000() {
        let dto = TayHoOrderDto(moneySpent: "3000", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 60)
    }
    
    func test_noWatchMovie_more5000() {
        let dto = TayHoOrderDto(moneySpent: "6000", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(result, 120)
    }
    
    
}
