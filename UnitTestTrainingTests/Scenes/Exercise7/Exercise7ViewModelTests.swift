//
//  Exercise7ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

class Exercise7ViewModelTests: XCTestCase {
    
    private var navigator: Exercise7NavigatorMock!
    private var useCase: Exercise7UseCaseMock!
    private var viewModel: Exercise7ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var isPremiumTrigger = BehaviorRelay<Bool>(value: false)
    private var cartAmountTrigger = BehaviorRelay<String>(value: "")
    private var isSelectQuickDeliverTrigger = BehaviorRelay<Bool>(value: false)
    
    override func setUp() {
        super.setUp()
        navigator = Exercise7NavigatorMock()
        useCase = Exercise7UseCaseMock()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise7ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isPremiumTrigger: isPremiumTrigger.asDriver(),
            cartAmount: cartAmountTrigger.asDriver(),
            isSelectQuickDeliver: isSelectQuickDeliverTrigger.asDriver()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    private func test_cartAmountTrigger_success() {
        self.useCase.validateCardAmountValue = ValidationResult.success(())
        cartAmountTrigger.accept("100")
        
        XCTAssert(self.useCase.validateCardAmountCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    private func test_cartAmountTrigger_error() {
        let errorMessage = "Must input number"
        
        self.useCase.validateCardAmountValue = ValidationResult.failure(ValidationError(message: errorMessage))
        cartAmountTrigger.accept("")
        
        XCTAssert(self.useCase.validateCardAmountCalled)
        XCTAssertEqual(output.errorMessage, errorMessage)
    }
    
    private func test_calculateDeliverFee() {
        self.useCase.calculationFeeValue = (standardFee: 0.0, quickFee: 500.0)
        
        isPremiumTrigger.accept(true)
        cartAmountTrigger.accept("2000")
        isSelectQuickDeliverTrigger.accept(true)
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 0.0)
        XCTAssertEqual(output.fee.quickFee, 500.0)
    }
    
}
