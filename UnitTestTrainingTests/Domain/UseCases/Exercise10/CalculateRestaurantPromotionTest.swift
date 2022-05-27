//
//  CalculateRestaurantPromotionTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 27/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest


final class CalculateRestaurantPromotionTest: XCTestCase, CalculateRestaurantPromotion {
    
    override func setUp() {
        super.setUp()
    }
    
    
    // Silver
    func test_isSilver_is3k() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 3000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(1, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isSilver_is5k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(2, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isSilver_is5k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(2, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isSilver_is10k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(4, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isSilver_is10k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(4, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    // Gold
    func test_isGold_is3k() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 3000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(3, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isGold_is5k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(5, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isGold_is5k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(5, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isGold_is10k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(10, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isGold_is10k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(10, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    // Black
    func test_isBlack_is3k() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 3000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(5, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isBlack_is5k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(7, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isBlack_is5k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(7, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_isBlack_is10k_isBonus() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(15, result.discount)
        XCTAssert(result.haveCoupon)
    }
    
    func test_isBlack_is10k_noBonus() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(15, result.discount)
        XCTAssertFalse(result.haveCoupon)
    }
}
