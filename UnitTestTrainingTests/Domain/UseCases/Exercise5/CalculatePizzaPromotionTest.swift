//
//  CalculatePizzaPromotionTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest

@testable import UnitTestTraining

class CalculatePizzaPromotionTest: XCTestCase, CalculatePizzaFee {
    
    override func setUp() {
        super.setUp()
    }
    
    private func test_validatePizzaPrice() {
        let result = self.validatePizzaPrice("100")
        
        XCTAssertEqual(result.isValid, true)
        XCTAssertEqual(result.message, "")
    }
    
    private func test_greater1500_deliver_hasCoupon() {
        let dto = PizzaOrderDto(price: "2000", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 2000 * 0.8)
        XCTAssertEqual(result.promotions, [.freePotato, .discount20Percent])
    }
    
    private func test_greater1500_deliver_noCoupon() {
        let dto = PizzaOrderDto(price: "2000", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 2000)
        XCTAssertEqual(result.promotions, [.freePotato])
    }
    
    private func test_greater1500_takeAway() {
        let dto = PizzaOrderDto(price: "2000", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 2000)
        XCTAssertEqual(result.promotions, [.freePotato, .freeSecondPizza])
    }
    
    private func test_less1500_deliver_hasCoupon() {
        let dto = PizzaOrderDto(price: "1200", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 1200 * 0.8)
        XCTAssertEqual(result.promotions, [.discount20Percent])
    }
    
    private func test_less1500_deliver_noCoupon() {
        let dto = PizzaOrderDto(price: "1200", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 1200)
        XCTAssertEqual(result.promotions, [])
    }
    
    private func test_less1500_takeAway() {
        let dto = PizzaOrderDto(price: "1200", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 1200)
        XCTAssertEqual(result.promotions, [.freeSecondPizza])
    }
    
}
