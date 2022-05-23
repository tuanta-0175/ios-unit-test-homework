//
//  Exercise6UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise6UseCaseMock: Exercise6UseCaseType {
    var calculateFreeMinutesCalled = false
    var calculateFreeMinutesValues = 0.0
    
    func calculateFreeMinutes(dto: TayHoOrderDto) -> Double {
        calculateFreeMinutesCalled = true
        return calculateFreeMinutesValues
    }
    
    var validateMoneyAmountCalled = false
    var validateMoneyAmountValues = ValidationResult.success(())
    
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        validateMoneyAmountCalled = true
        return validateMoneyAmountValues
    }
}

