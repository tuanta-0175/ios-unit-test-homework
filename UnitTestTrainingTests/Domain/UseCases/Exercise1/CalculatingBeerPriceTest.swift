//
//  CalculatingBeerPriceTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculatingBeerPriceTest: XCTestCase, CalculatingBeerPrice {
    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.date(from: string) ?? Date()
    }
    
    func test_usingVoucher() {
        let dto = BeerOrderDto(usingVoucher: true, purchaseTime: Date())
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 100)
    }
    
    func test_notUseVoucher_inPromotionTime() {
        let date = createDayWith(string: "2022/05/18 17:00:00")
        let dto = BeerOrderDto(usingVoucher: false, purchaseTime: date)
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 290)
    }
    
    func test_notUseVoucher_notInPromotionTime() {
        let date = createDayWith(string: "2022/05/18 22:00:00")
        let dto = BeerOrderDto(usingVoucher: false, purchaseTime: date)
        let result = self.calculateBeerPrice(dto: dto)
        
        XCTAssertEqual(result, 490)
    }
}
