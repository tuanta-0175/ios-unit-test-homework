//
//  Exercise8UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.cong.anh on 29/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Dto
import ValidatedPropertyKit

final class Exercise8UseCaseMock: Exercise8UseCaseType {

    // MARK: - validateAge
    var validateAgeCalled = false
    var validateAgeReturnValue = ValidationResult.success(())

    func validateAge(_ age: String) -> ValidationResult {
        validateAgeCalled = true
        return validateAgeReturnValue
    }

    // MARK: - calculatePlayFee
    var calculatePlayFeeCalled = false
    var calculatePlayFeeReturnValue = 0.0

    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
        calculatePlayFeeCalled = true
        return calculatePlayFeeReturnValue
    }
}

