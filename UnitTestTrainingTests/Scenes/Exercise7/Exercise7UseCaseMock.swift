//
//  Exercise7UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

final class Exercise7UseCaseMock: XCTestCase, Exercise7UseCaseType {
    
    var calculationFeeCalled = false
    var calculationFeeValue = (standardFee: 0.0, quickFee: 0.0)
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return calculationFeeValue
    }
    
    var validateCardAmountCalled = false
    var validateCardAmountValue = ValidationResult.success(())
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmountCalled = false
        return validateCardAmountValue
    }
    
}
