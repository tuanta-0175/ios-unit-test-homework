//
//  CaculatingTransportationFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by Nguyen The Vinh on 4/30/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CaculatingTransportationFeeTest: XCTestCase, CalculatingTransportationFee {

    override func setUp() {
        super.setUp()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_smallAmount_normalUser_normalShip() {
        let dto = VietnamMartOrderDto(cartAmount: "500", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(500))
        XCTAssertEqual(result.quickFee, Double(0))
    }

    func test_smallAmount_normalUser_quickShip() {
        let dto = VietnamMartOrderDto(cartAmount: "500", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(500))
        XCTAssertEqual(result.quickFee, Double(500))
    }

    func test_smallAmount_vipUser_normalShip() {
        let dto = VietnamMartOrderDto(cartAmount: "1230", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(0))
    }

    func test_smallAmount_vipUser_quickShip() {
        let dto = VietnamMartOrderDto(cartAmount: "4999.99", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(500))
    }

    func test_largeAmount_normalUser_normalShip() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(0))
    }

    func test_largeAmount_normalUser_quickShip() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: false, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(500))
    }

    func test_largeAmount_vipUser_normalShip() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: false)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(0))
    }

    func test_largeAmount_viplUser_quickShip() {
        let dto = VietnamMartOrderDto(cartAmount: "5000", isPremiumMember: true, isQuickDeliver: true)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, Double(0))
        XCTAssertEqual(result.quickFee, Double(500))
    }
}
