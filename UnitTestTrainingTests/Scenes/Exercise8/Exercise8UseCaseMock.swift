//
//  Exercise8UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise8UseCaseMock: Exercise8UseCaseType {
    
    var validateAgeCalled = true
    var validateAgeValue = ValidationResult.failure("Failed")
    
    func validateAge(_ age: String) -> ValidationResult {
        validateAgeCalled = true
        return validateAgeValue
    }
    
    var calculatePlayFeeCalled = false
    var calculatePlayFeeValues: Double = 0
    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
        calculatePlayFeeCalled = true
        return calculatePlayFeeValues
    }
    
    
}
