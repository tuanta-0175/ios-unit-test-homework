//
//  CalculateRestaurantPromotionTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateRestaurantPromotionTest: XCTestCase, CalculateRestaurantPromotion {
    // Case 1:
    // Thứ Hạng: Bạc
    // Số tiền: 3000
    // Bốc thăm: nil
    func test_case1() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 3000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 1)
        XCTAssertEqual(result.haveCoupon, false)
    }

    // Case 2:
    // Thứ Hạng: Bạc
    // Số tiền: 5000
    // Bốc thăm: true
    func test_case2() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 2)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 3:
    // Thứ Hạng: Bạc
    // Số tiền: 5000
    // Bốc thăm: false
    func test_case3() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 2)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // Case 4:
    // Thứ Hạng: Bạc
    // Số tiền: 10000
    // Bốc thăm: true
    func test_case4() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 4)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 5:
    // Thứ Hạng: Bạc
    // Số tiền: 10000
    // Bốc thăm: false
    func test_case5() {
        let dto = RestaurantPromotionDto(memberRank: .silver, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 4)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // Case 6:
    // Thứ Hạng: Vàng
    // Số tiền: 3000
    // Bốc thăm: nil
    func test_case6() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 3000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 3)
        XCTAssertEqual(result.haveCoupon, false)
    }

    // Case 7:
    // Thứ Hạng: Vàng
    // Số tiền: 5000
    // Bốc thăm: true
    func test_case7() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 8:
    // Thứ Hạng: Vàng
    // Số tiền: 5000
    // Bốc thăm: false
    func test_case8() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // Case 9:
    // Thứ Hạng: Vàng
    // Số tiền: 10000
    // Bốc thăm: true
    func test_case9() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 10)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 10:
    // Thứ Hạng: Vàng
    // Số tiền: 10000
    // Bốc thăm: false
    func test_case10() {
        let dto = RestaurantPromotionDto(memberRank: .gold, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 10)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // Case 11:
    // Thứ Hạng: Black
    // Số tiền: 3000
    // Bốc thăm: nil
    func test_case11() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 3000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 5)
        XCTAssertEqual(result.haveCoupon, false)
    }

    // Case 12:
    // Thứ Hạng: Black
    // Số tiền: 5000
    // Bốc thăm: true
    func test_case12() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 5000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 7)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 13:
    // Thứ Hạng: Black
    // Số tiền: 5000
    // Bốc thăm: false
    func test_case13() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 5000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 7)
        XCTAssertEqual(result.haveCoupon, false)
    }
    
    // Case 14:
    // Thứ Hạng: Black
    // Số tiền: 10000
    // Bốc thăm: true
    func test_case14() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 10000, participateLottery: true)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 15)
        XCTAssertEqual(result.haveCoupon, true)
    }
    
    // Case 15:
    // Thứ Hạng: Black
    // Số tiền: 10000
    // Bốc thăm: false
    func test_case15() {
        let dto = RestaurantPromotionDto(memberRank: .black, prepaidPaymentLimit: 10000, participateLottery: false)
        let result = self.calculateRestaurantPromotion(dto: dto)
        
        XCTAssertEqual(result.discount, 15)
        XCTAssertEqual(result.haveCoupon, false)
    }
}

