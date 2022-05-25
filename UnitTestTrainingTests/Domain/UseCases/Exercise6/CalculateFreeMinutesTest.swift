//
//  CalculateFreeMinutes.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculateFreeMinutesTest: XCTestCase, CalculatingFreeMinutes {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_isMovie_greater5k() {
        
        let dto = TayHoOrderDto(moneySpent: "5000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(300, result)
    }
    
    func test_isMovie_greate2k_less5K() {
        let dto = TayHoOrderDto(moneySpent: "3000", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(240, result)
    }
    
    func test_isMovie_less2k() {
        let dto = TayHoOrderDto(moneySpent: "1999", watchingMovie: true)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(180, result)
    }
    
    func test_noMovie_greate5K() {
        let dto = TayHoOrderDto(moneySpent: "5001", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(120, result)
    }
    
    func test_noMovie_greate2k_less5k() {
        let dto = TayHoOrderDto(moneySpent: "3000", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(60, result)
    }
    
    func test_noMovie_less2k() {
        let dto = TayHoOrderDto(moneySpent: "1999", watchingMovie: false)
        let result = self.calculateFreeMinutes(dto: dto)
        
        XCTAssertEqual(0, result)
    }
    
}
