//
//  Exercise7UseCaseMock.swift
//  DALi
//
//  Created by bui.van.hung on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Dto
import ValidatedPropertyKit

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    
    var calculationFeeCalled = false
    var calculationFeeValues = (0.0, 0.0)
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return calculationFeeValues
    }
    
    var validateCardAmountCalled = false
    var validateCardAmountReturnValue = ValidationResult.success(())
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmountCalled = true
        return validateCardAmountReturnValue
    }
}
