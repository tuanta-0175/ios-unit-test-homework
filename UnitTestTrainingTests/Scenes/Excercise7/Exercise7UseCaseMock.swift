//
//  Exercise7UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    var calculationFeeCalled = false
    var calculationFeeValues = (0.0, 0.0)
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        calculationFeeCalled = true
        return calculationFeeValues
    }
    
    var validateCardAmountCalled = false
    var validateCardAmountValues = ValidationResult.success(())
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        validateCardAmountCalled = true
        return validateCardAmountValues
    }
}
