//
//  CalculatePizzaFeeResultTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest


final class CalculatePizzaFeeRTest: XCTestCase, CalculatePizzaFee {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_priceGreater_1500_deliver_isCoupon() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.promotions.count, 2)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssert(result.promotions.contains(.discount20Percent))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
    
    func test_priceGreater_1500_deliver_notCoupon() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.promotions.count, 1)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.discount20Percent))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
        
    func test_priceLess_1500_deliver_isCoupon() {
        let dto = PizzaOrderDto(price: "100", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 80)
        XCTAssert(result.promotions.contains(.discount20Percent))
        XCTAssertFalse(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
        XCTAssertEqual(result.promotions.count, 1)
    }
    
    func test_priceLess_1500_deliver_notCoupon() {
        let dto = PizzaOrderDto(price: "100", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 100)
        XCTAssert(result.promotions.isEmpty)
    }
    
    func test_priceGreater_1500_takeAway() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.promotions.count, 2)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssert(result.promotions.contains(.freeOnMonday))
        XCTAssertFalse(result.promotions.contains(.discount20Percent))
    }
    
    func test_priceLess_1500_takeAway() {
        let dto = PizzaOrderDto(price: "100", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, 100)
        XCTAssertEqual(result.promotions.count, 1)
        XCTAssert(result.promotions.contains(.freeOnMonday))
        XCTAssertFalse(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.discount20Percent))
    }
}
