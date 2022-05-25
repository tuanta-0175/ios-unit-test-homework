//
//  Exercise8UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

class Exercise8UseCaseMock: XCTestCase, Exercise8UseCaseType {
    
    var validateAgeCalled = false
    var validateAgeValue = ValidationResult.success(())
    
    func validateAge(_ age: String) -> ValidationResult {
        validateAgeCalled = true
        return validateAgeValue
    }
    
    var calculatePlayFeeCalled = false
    var calculatePlayFeeValue = 0.0
    
    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
        calculatePlayFeeCalled = true
        return calculatePlayFeeValue
    }
    
}
