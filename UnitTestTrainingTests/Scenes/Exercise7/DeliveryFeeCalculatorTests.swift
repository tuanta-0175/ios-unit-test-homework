//
//  DeliveryFeeCalculatorTests.swift
//  UnitTestTrainingTests
//
//  Created by Le Hung on 28/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class DeliveryFeeCalculatorTests: XCTestCase {
    let deliveryFeeCalculator = DeliveryFeeCalculator()
    
    func test_amount_les_than_5000() {
        let amount: Double = 4999
        let standardFee = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: false,
            isQuickDeliver: false
        )
        .standardFee
        
        XCTAssertEqual(standardFee, 500)
    }
    
    func test_amount_equal_5000() {
        let amount: Double = 5000
        let standardFee = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: false,
            isQuickDeliver: false
        )
        .standardFee
        
        XCTAssertEqual(standardFee, 0)
    }
    
    func test_amoun_greater_5000() {
        let amount: Double = 5001
        let standardFee = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: false,
            isQuickDeliver: false
        )
        .standardFee
        
        XCTAssertEqual(standardFee, 0)
    }
    
    func test_premium_member() {
        let amount: Double = 4999
        let standardFee = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: true,
            isQuickDeliver: false
        )
        .standardFee
        
        XCTAssertEqual(standardFee, 0)
    }
    
    func test_quick_deliver() {
        let amount: Double = 4999
        
        let quickFeeNonPremiumMember = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: false,
            isQuickDeliver: true
        )
        .quickFee
        
        let quickFeePremiumMember = deliveryFeeCalculator.getDeliveryFee(
            for: amount,
            isPremiumMember: true,
            isQuickDeliver: true
        )
        .quickFee
        
        XCTAssertEqual(quickFeeNonPremiumMember, 500)
        XCTAssertEqual(quickFeePremiumMember, 500)
    }
}
