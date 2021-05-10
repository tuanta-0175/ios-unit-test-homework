//
//  CaculatingTransportationFeeTests.swift
//  UnitTestTrainingTests
//
//  Created by bui.van.hung on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CaculatingTransportationFeeTests: XCTestCase, CaculatingTransportationFee {
    
    // Test case 1
    // - Thành viên premium - Y
    // - Mua hàng trên 5,000 yên - Y
    // - Giao hàng siêu tốc - Y
    // - result standardFee - 0
    // - result quickFee - 500
    
    func testCase1() {
        let dto = VietnamMartOrderDto(cartAmount: "7000.0", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // Test case 2
    // - Thành viên premium - Y
    // - Mua hàng trên 5,000 yên - Y
    // - Giao hàng siêu tốc - N
    // - result standardFee - 0
    // - result quickFee - 0
    
    func testCase2() {
        let dto = VietnamMartOrderDto(cartAmount: "7000.0", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // Test case 3
    // - Thành viên premium - Y
    // - Mua hàng trên 5,000 yên - N
    // - Giao hàng siêu tốc - Y
    // - result standardFee - 0
    // - result quickFee - 500
    
    func testCase3_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "3000.0", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // Test case 4
    // - Thành viên premium - Y
    // - Mua hàng trên 5,000 yên - N
    // - Giao hàng siêu tốc - N
    // - result standardFee - 0
    // - result quickFee - 0
    
    func testCase4_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "7000.0", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // Test case 5
    // - Thành viên premium - N
    // - Mua hàng trên 5,000 yên - Y
    // - Giao hàng siêu tốc - Y
    // - result standardFee - 0
    // - result quickFee - 500
    
    func testCase5_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "7000.0", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // Test case 6
    // - Thành viên premium - N
    // - Mua hàng trên 5,000 yên - Y
    // - Giao hàng siêu tốc - N
    // - result standardFee - 0
    // - result quickFee - 0
    
    func testCase6_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "7000.0", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    // Test case 7
    // - Thành viên premium - N
    // - Mua hàng trên 5,000 yên - N
    // - Giao hàng siêu tốc - Y
    // - result standardFee - 500
    // - result quickFee - 500
    
    func testCase7_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "3000.0", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    // Test case 8
    // - Thành viên premium - N
    // - Mua hàng trên 5,000 yên - N
    // - Giao hàng siêu tốc - N
    // - result standardFee - 500
    // - result quickFee - 0
    
    func testCase8_calculationFee() {
        let dto = VietnamMartOrderDto(cartAmount: "3000.0", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
}
