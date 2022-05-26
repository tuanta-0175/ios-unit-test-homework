//
//  Exercise7UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    
    var calculationFeeCalled = false
    var feeValues: (standardFee: Double, quickFee: Double) = (standardFee: 0, quickFee: 0)

    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return feeValues
    }
    
    var validateCardAmountCalled = false
    var validateCardAmountValues: ValidationResult = ValidationResult.failure("Faild")
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmountCalled = true
        return validateCardAmountValues
    }
    
    
}
