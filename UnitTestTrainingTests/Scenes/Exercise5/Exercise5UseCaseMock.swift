//
//  Exercise5UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

final class Exercise5UseCaseMock: Exercise5UseCaseType {
    
    // MARK: - calculateFee
    var calculateFeeCalled = false
    var calculateFeeValue = CalculatePizzaFeeResult(fee: 0, promotions: [])
    
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        calculateFeeCalled = true
        return calculateFeeValue
    }
    
    // MARK: - validatePizzaPrice
    var validatePizzaPriceCalled = false
    var validatePizzaPriceValue = ValidationResult.success(())
    
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validatePizzaPriceCalled = true
        return validatePizzaPriceValue
    }
}
