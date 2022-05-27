//
//  CaculatingTransportationFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CaculatingTransportationFeeTest: XCTestCase, CaculatingTransportationFee {
    override func setUp() {
        super.setUp()
    }
    
    func test_isPremium_greater5k_isGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_isPremium_greater5k_notGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_isPremium_less5k_isGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "100", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_isPremium_less5k_notGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "100", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_notPremium_greater5k_isGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_notPremium_greater5k_notGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0)
        XCTAssertEqual(result.quickFee, 0)
    }
    
    func test_notPremium_less5k_isGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "100", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500)
        XCTAssertEqual(result.quickFee, 500)
    }
    
    func test_notPremiu_less5k_notGofast() {
        let dto = VietnamMartOrderDto(cartAmount: "100", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500)
        XCTAssertEqual(result.quickFee, 0)
    }
}
