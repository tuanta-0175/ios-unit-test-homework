//
//  Exercise6UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

final class Exercise6UseCaseMock: XCTestCase, Exercise6UseCaseType {
    
    var calculateFreeMinutesCalled = false
    var calculateFreeMinutesValue = 0.0
    
    func calculateFreeMinutes(dto: TayHoOrderDto) -> Double {
        calculateFreeMinutesCalled = true
        return calculateFreeMinutesValue
    }
    
    var validateMoneyAmountCalled = false
    var validateMoneyAmountValue = ValidationResult.success(())
    
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        validateMoneyAmountCalled = true
        return validateMoneyAmountValue
    }
    
}
