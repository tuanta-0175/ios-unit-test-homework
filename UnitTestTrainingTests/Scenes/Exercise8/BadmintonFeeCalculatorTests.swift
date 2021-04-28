//
//  BadmintonFeeCalculator.swift
//  UnitTestTrainingTests
//
//  Created by Le Hung on 28/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class BadmintonFeeCalculatorTests: XCTestCase {
    let calculator = BadmintonFeeCalculator()
    
    func test_no_discount() {
        let fee = calculator.calculateFee(
            age: 20,
            isFemal: false,
            weekDay: Date.DayInWeek.monday
        )
        
        XCTAssertEqual(fee, 1800)
    }
    
    func test_age_less_than_13() {
        let fee = calculator.calculateFee(
            age: 12,
            isFemal: false,
            weekDay: Date.DayInWeek.monday
        )
        
        XCTAssertEqual(fee, 900)
    }
    
    func test_age_greater_than_65() {
        let fee = calculator.calculateFee(
            age: 66,
            isFemal: false,
            weekDay: Date.DayInWeek.monday
        )
        
        XCTAssertEqual(fee, 1600)
    }
    
    func test_femal_play_in_friday() {
        let fee = calculator.calculateFee(
            age: 20,
            isFemal: true,
            weekDay: Date.DayInWeek.friday
        )
        
        XCTAssertEqual(fee, 1400)
    }
    
    func test_play_in_tuesday() {
        let fee = calculator.calculateFee(
            age: 20,
            isFemal: true,
            weekDay: Date.DayInWeek.tuesday
        )
        
        XCTAssertEqual(fee, 1200)
    }

}
