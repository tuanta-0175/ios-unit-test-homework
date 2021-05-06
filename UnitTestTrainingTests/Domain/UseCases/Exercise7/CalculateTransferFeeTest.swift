//
//  CalculateTransferFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 06/05/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculateTransferFeeTest: XCTestCase, CaculatingTransportationFee {
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: Test case Calculate Trasportation Fee
    // test case 1:
    /// Fee >= 5000 yên: Y
    /// Premium:              Y
    /// Quick transfer:      Y
    func test_case1() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: true)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // test case 2:
    /// Fee >= 5000 yên: Y
    /// Premium:              Y
    /// Quick transfer:      N
    func test_case2() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: false)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // test case 3:
    /// Fee >= 5000 yên: Y
    /// Premium:              N
    /// Quick transfer:      N
    func test_case3() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: false)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // test case 4:
    /// Fee >= 5000 yên: N
    /// Premium:              N
    /// Quick transfer:      N
    func test_case4() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: false)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // test case 5:
    /// Fee >= 5000 yên: Y
    /// Premium:              N
    /// Quick transfer:      Y
    func test_case5() {
        let dto = VietnamMartOrderDto(cartAmount: "5001.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: true)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // test case 6:
    /// Fee >= 5000 yên: N
    /// Premium:              Y
    /// Quick transfer:      N
    func test_case6() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: false)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // test case 7:
    /// Fee >= 5000 yên: N
    /// Premium:              Y
    /// Quick transfer:      Y
    func test_case7() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: true)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // test case 8:
    /// Fee >= 5000 yên: N
    /// Premium:              N
    /// Quick transfer:      Y
    func test_case8() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: true)
        
        let result = self.calculationFee(dto: dto)
        
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // MARK: Test case validate Card Amount
    // test case success
    func test_case_validate_success() {
        let result = self.validateCardAmount("5000")
        
        XCTAssert(result.isValid)
    }
    
    func test_case_validate_failed() {
        let result = self.validateCardAmount("0")
        
        XCTAssertFalse(result.isValid)
    }
    
    func test_case_validate_failed_unwrapped() {
        let result = self.validateCardAmount("string")
        
        XCTAssertFalse(result.isValid)
    }
}
