//
//  CaculatingTransportationFeeTests.swift
//  UnitTestTraining
//
//  Created by trinh.giang.dong on 10/05/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Foundation

final class CaculatingTransportationFeeTests: XCTestCase, CaculatingTransportationFee {
    
    override func setUp() {
        super.setUp()
    }
    
    /// Test case 1
    /// - Premium: YES
    /// - Buy more than 5,000円: YES
    /// - Quick deliver: YES
    func testCase1_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 2
    /// - Premium: YES
    /// - Buy more than 5,000円: YES
    /// - Quick deliver: NO
    func testCase2_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "10500.0", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 3
    /// - Premium: YES
    /// - Buy more than 5,000円: NO
    /// - Quick deliver: YES
    func testCase3_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.0", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 4
    /// - Premium: YES
    /// - Buy more than 5,000円: NO
    /// - Quick deliver: NO
    func testCase4_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "4990.0", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 5
    /// - Premium: NO
    /// - Buy more than 5,000円: YES
    /// - Quick deliver: YES
    func testCase5_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "4900.0", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 6
    /// - Premium: NO
    /// - Buy more than 5,000円: YES
    /// - Quick deliver: NO
    func testCase6_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 7
    /// - Premium: NO
    /// - Buy more than 5,000円: NO
    /// - Quick deliver: YES
    func testCase7_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "2000.0", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 1
    /// - Premium: NO
    /// - Buy more than 5,000円: NO
    /// - Quick deliver: NO
    func testCase8_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "2000.0", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    /// Test case 9
    /// - Premium: NO
    /// - Buy more than 5,000円: YES
    /// - Quick deliver: YES
    func testCase9_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "5000.0", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }

    func test_validateCardAmount_success() {
        let result = self.validateCardAmount("2000")
        XCTAssert(result.isValid)
    }

    func test_validateCardAmount_failed() {
        let result = self.validateCardAmount("0")
        XCTAssertFalse(result.isValid)
    }

    func test_validateCardAmount_failed_NaN() {
        let result = self.validateCardAmount("test invalidate string")
        XCTAssertFalse(result.isValid)
    }
}
