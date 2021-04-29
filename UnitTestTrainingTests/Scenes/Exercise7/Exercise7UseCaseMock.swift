//
//  Exercise7UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.cong.anh on 29/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Dto
import ValidatedPropertyKit

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    // MARK: - calculationFee
    var calculationFeeCalled = false
    var calculationFeeReturnValue = (standardFee: 500.0, quickFee: 500.0)
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return calculationFeeReturnValue
    }
    
    // MARK: - validateCardAmount
    var validateCardAmountCalled = false
    var validateCardAmountReturnValue = ValidationResult.success(())
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmountCalled = true
        return validateCardAmountReturnValue
    }
}
