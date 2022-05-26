//
//  Exercise6UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise6UseCaseMock: Exercise6UseCaseType {
    var calculateFreeMinutesCalled = false
    var calculateFreeMinutesValue: Double = 0
    func calculateFreeMinutes(dto: TayHoOrderDto) -> Double {
        calculateFreeMinutesCalled = true
        return calculateFreeMinutesValue
    }
    
    var validateMoneyAmountCalled = false
    var validateMoneyAmountValue: ValidationResult = ValidationResult.failure("Failed")
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        validateMoneyAmountCalled = true
        return validateMoneyAmountValue
    }
    
    
}
