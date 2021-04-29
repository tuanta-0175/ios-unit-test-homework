//
//  CaculatingTransportationFeeTests.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.cong.anh on 29/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CaculatingTransportationFeeTests: XCTestCase, CaculatingTransportationFee {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_validateCardAmount_success() {
        let result = self.validateCardAmount("1500")
        XCTAssert(result.isValid)
    }
    
    func test_validateCardAmount_error_value() {
        let result = self.validateCardAmount("-1")
        XCTAssertFalse(result.isValid)
    }
    
    func test_validateCardAmount_error_format() {
        let result = self.validateCardAmount("aaa")
        XCTAssertFalse(result.isValid)
    }
    
    /// - Mua hàng từ 5,000円/lần: N
    /// - Thành viên premium: N
    /// - Giao hàng siêu tốc: N
    func test_calculationFee1() {
        let dto = VietnamMartOrderDto(cartAmount: "1000.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// - Mua hàng từ 5,000円/lần: Y
    /// - Thành viên premium: N
    /// - Giao hàng siêu tốc: N
    func test_calculationFee2() {
        let dto = VietnamMartOrderDto(cartAmount: "5000.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// - Mua hàng từ 5,000円/lần: N
    /// - Thành viên premium: Y
    /// - Giao hàng siêu tốc: N
    func test_calculationFee3() {
        let dto = VietnamMartOrderDto(cartAmount: "1000.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// - Mua hàng từ 5,000円/lần: N
    /// - Thành viên premium: N
    /// - Giao hàng siêu tốc: Y
    func test_calculationFee4() {
        let dto = VietnamMartOrderDto(cartAmount: "4000.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }

    /// - Mua hàng từ 5,000円/lần: Y
    /// - Thành viên premium: Y
    /// - Giao hàng siêu tốc: N
    func test_calculationFee5() {
        let dto = VietnamMartOrderDto(cartAmount: "6000.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// - Mua hàng từ 5,000円/lần: N
    /// - Thành viên premium: Y
    /// - Giao hàng siêu tốc: Y
    func test_calculationFee6() {
        let dto = VietnamMartOrderDto(cartAmount: "4000.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }

    /// - Mua hàng từ 5,000円/lần: Y
    /// - Thành viên premium: N
    /// - Giao hàng siêu tốc: Y
    func test_calculationFee7() {
        let dto = VietnamMartOrderDto(cartAmount: "6000.0",
                                      isPremiumMember: false,
                                      isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// - Mua hàng từ 5,000円/lần: Y
    /// - Thành viên premium: Y
    /// - Giao hàng siêu tốc: Y
    func test_calculationFee8() {
        let dto = VietnamMartOrderDto(cartAmount: "6000.0",
                                      isPremiumMember: true,
                                      isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
}
