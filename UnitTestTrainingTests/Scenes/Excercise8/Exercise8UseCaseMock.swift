//
//  Exercise8UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise8UseCaseMock: Exercise8UseCaseType {
    var validateAgeCalled = false
    var validateAgeValues = ValidationResult.success(())
    
    func validateAge(_ age: String) -> ValidationResult {
        validateAgeCalled = true
        return validateAgeValues
    }
    
    var calculatePlayFeeCalled = false
    var calculatePlayFeeValues = 0.0
    
    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
        calculatePlayFeeCalled = true
        return calculatePlayFeeValues
    }
}
