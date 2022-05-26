//
//  CalculateRestaurantPromotionTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class CalculateRestaurantPromotionTest: XCTestCase, CalculateRestaurantPromotion {
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: - Silver
    func test_silver_3000yen() {
        let dto = RestaurantPromotionDto(
            memberRank: .silver,
            prepaidPaymentLimit: 3000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 1)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_silver_5000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .silver,
            prepaidPaymentLimit: 5000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 2)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_silver_5000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .silver,
            prepaidPaymentLimit: 5000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 2)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_silver_10000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .silver,
            prepaidPaymentLimit: 10000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 4)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_silver_10000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .silver,
            prepaidPaymentLimit: 10000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 4)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // MARK: - Gold
    func test_gold_3000yen() {
        let dto = RestaurantPromotionDto(
            memberRank: .gold,
            prepaidPaymentLimit: 3000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 3)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_gold_5000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .gold,
            prepaidPaymentLimit: 5000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_gold_5000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .gold,
            prepaidPaymentLimit: 5000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_gold_10000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .gold,
            prepaidPaymentLimit: 10000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 10)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_gold_10000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .gold,
            prepaidPaymentLimit: 10000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 10)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // MARK: - Black
    func test_black_3000yen() {
        let dto = RestaurantPromotionDto(
            memberRank: .black,
            prepaidPaymentLimit: 3000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_black_5000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .black,
            prepaidPaymentLimit: 5000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 7)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_black_5000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .black,
            prepaidPaymentLimit: 5000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 7)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    func test_black_10000yen_hasLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .black,
            prepaidPaymentLimit: 10000,
            participateLottery: true
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 15)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    func test_black_10000yen_noLottery() {
        let dto = RestaurantPromotionDto(
            memberRank: .black,
            prepaidPaymentLimit: 10000,
            participateLottery: false
        )
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 15)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
}
