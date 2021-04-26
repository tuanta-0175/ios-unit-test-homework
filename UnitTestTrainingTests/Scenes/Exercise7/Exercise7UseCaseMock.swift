//
//  Exercise7UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 19/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import Dto
import ValidatedPropertyKit

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    var validateCardAmounntCalled = false
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmounntCalled = true
        return VietnamMartOrderDto.validateCartAmount(amount).mapToVoid()
    }
    
    var calculationFeeCalled = false
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return (0.0, 0.0)
    }
}
