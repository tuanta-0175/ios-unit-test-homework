//
//  Exercise5UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise5UseCaseMock: Exercise5UseCaseType {
    
    var calculateFeeCalled = false
    var calculateFeeValue: CalculatePizzaFeeResult = CalculatePizzaFeeResult()
    
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        calculateFeeCalled = true
        return calculateFeeValue
    }
    
    var validatePizzaPriceCalled = false
    var validationResult: ValidationResult = ValidationResult.failure("Failed")
    
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validatePizzaPriceCalled = true
        return validationResult
    }
    
    
}
