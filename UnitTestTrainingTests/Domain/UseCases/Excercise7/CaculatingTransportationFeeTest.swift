//
//  CaculatingTransportationFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CaculatingTransportationFeeTest: XCTestCase, CaculatingTransportationFee {
    func test_isPremium_more5000_fastDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "6000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    func test_isPremium_more5000_standardDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "6000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    func test_isPremium_less5000_fastDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "4000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    func test_isPremium_less5000_standardDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "4000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    func test_notPremium_more5000_fastDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "6000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    func test_notPremium_more5000_standardDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "6000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    func test_notPremium_less5000_fastDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "4000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    func test_notPremium_less5000_standardDelivery() {
        let dto = VietnamMartOrderDto(cartAmount: "4000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
}
