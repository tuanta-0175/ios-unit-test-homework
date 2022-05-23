//
//  CalculateBeerPriceTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateBeerPriceTest: XCTestCase, CalculatingBeerPrice {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_Voucher() {
        let dto = BeerOrderDto(usingVoucher: true, purchaseTime: Date())
        let result = self.calculateBeerPrice(dto: dto)
        XCTAssertEqual(result, 100)
    }
    
    func test_IntimeSale() {
        let dtoStart = BeerOrderDto(usingVoucher: false, purchaseTime: Date(hour: 16, minute: 0, second: 0)!)
        let resultStart = self.calculateBeerPrice(dto: dtoStart)
        let dtoFinish = BeerOrderDto(usingVoucher: false, purchaseTime: Date(hour: 18, minute: 0, second: 0)!)
        let resulFinish = self.calculateBeerPrice(dto: dtoFinish)
        XCTAssertEqual(resultStart, 290)
        XCTAssertNotEqual(resulFinish, 290)
    }
    
    func test_OutTimeSale() {
        let dto = BeerOrderDto(usingVoucher: false, purchaseTime: Date(hour: 20, minute: 0, second: 0)!)
        let result = self.calculateBeerPrice(dto: dto)
        XCTAssertEqual(result, 490)
    }
}
