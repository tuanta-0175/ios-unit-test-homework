//
//  CalculatePizzaFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculatePizzaFeeTest: XCTestCase, CalculatePizzaFee {

    func test_priceValueMoreThan1500_deliver_haveCoupon() {
        let promotions: [PromotionType] = [.freePotato, .discount20Percent]
        let price: Double = 1600
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price*0.8)
        XCTAssertEqual(result.promotions, promotions)
    }

    func test_priceValueMoreThan1500_deliver_noCoupon() {
        let promotions: [PromotionType] = [.freePotato]
        let price: Double = 1600
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price)
        XCTAssertEqual(result.promotions, promotions)
    }

    func test_priceValueMoreThan1500_takeAway() {
        let promotions: [PromotionType] = [.freePotato, .freeOnMonday]
        let price: Double = 1600
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price)
        XCTAssertEqual(result.promotions, promotions)
    }

    func test_priceValueLessThan1500_deliver_haveCoupon() {
        let promotions: [PromotionType] = [.discount20Percent]
        let price: Double = 1000
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price*0.8)
        XCTAssertEqual(result.promotions, promotions)
    }

    func test_priceValueLessThan1500_deliver_notCoupon() {
        let promotions: [PromotionType] = []
        let price: Double = 1000
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price)
        XCTAssertEqual(result.promotions, promotions)
    }

    func test_priceValueLessThan1500_takeAway() {
        let promotions: [PromotionType] = [.freeOnMonday]
        let price: Double = 1000
        let dto = PizzaOrderDto(price: String(price), receiveMethod: .takeAway, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result.fee, price)
        XCTAssertEqual(result.promotions, promotions)
    }
}
