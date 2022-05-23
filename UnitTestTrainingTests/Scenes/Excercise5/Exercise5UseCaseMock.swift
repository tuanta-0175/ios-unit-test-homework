//
//  Exercise5UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise5UseCaseMock: Exercise5UseCaseType {
    var calculateFeeCalled = false
    var calculateFeeValues = CalculatePizzaFeeResult()

    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        calculateFeeCalled = true
        return calculateFeeValues
    }

    var validatePizzaPriceCalled = false
    var validatePizzaPriceValues = ValidationResult.empty

    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validatePizzaPriceCalled = true
        return validatePizzaPriceValues
    }
    
}
