//
//  Exercise8UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 19/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import Dto
import ValidatedPropertyKit

final class Exercise8UseCaseMock: Exercise8UseCaseType {
    var validateAgeCalled = false
    func validateAge(_ age: String) -> ValidationResult {
        validateAgeCalled = true
        return BadmintonGameDto.validateAge(age).mapToVoid()
    }
    
    var calculatePlayFeeCalled = false
    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
        calculatePlayFeeCalled = true
        return 0.0
    }
}
