//
//  Exercise7CalculateDeliverFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise7CalculateDeliverFeeTest: XCTestCase, CaculatingTransportationFee {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_validateCartAmount() {
        let result = self.validateCardAmount("100")
        XCTAssertEqual(result.isValid, true)
        XCTAssertEqual(result.message, "")
    }
    
    func test_premiumMember_feeGreater5000_quickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_premiumMember_feeLess5000_quickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "2000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_premiumMember_feeGreater5000_noQuickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_premiumMember_feeLess5000_noQuickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "2000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_noPremiumMember_feeGreater5000_quickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_noPremiumMember_feeGreater5000_noQuickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_noPremiumMember_feeLess5000_quickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "2000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_noPremiumMember_feeLess5000_noQuickDeliver() {
        let dto = VietnamMartOrderDto(cartAmount: "2000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500)
        XCTAssertEqual(result.quickFee, 0)
    }
    
}
