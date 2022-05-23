//
//  CalculateBeerPriceTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class CalculateBeerPriceTests: XCTestCase, CalculatingBeerPrice {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_useVoucher() {
        let dto = BeerOrderDto(usingVoucher: true, purchaseTime: Date())
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 100)
    }
    
    func test_notUseVoucher_inPromotionTime() {
        let date = Date(hour: 17) ?? Date() // Date.createDayWith(string: "2022/05/18 10:10:00") // 17:10:00 // +7
        let dto = BeerOrderDto(usingVoucher: false, purchaseTime: date)
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 290)
    }
    
    func test_notUseVoucher_notInPromotionTime() {
        let date = Date(hour: 18) ?? Date()
        let dto = BeerOrderDto(usingVoucher: false, purchaseTime: date)
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 490)
    }
    
}
