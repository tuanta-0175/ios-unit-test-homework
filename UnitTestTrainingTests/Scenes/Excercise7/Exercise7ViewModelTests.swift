//
//  Exercise2ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto
import ValidatedPropertyKit

final class Exercise7ViewModelTests: XCTestCase {
    private var viewModel: Exercise7ViewModel!
    private var navigator: Exercise7NavigatorMock!
    private var useCase: Exercise7UseCaseMock!
    
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let isPremiumTrigger = BehaviorRelay<Bool>(value: true)
    private let cartAmount = BehaviorRelay<String>(value: String())
    private let isSelectQuickDeliver = BehaviorRelay<Bool>(value: true)

    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise7NavigatorMock()
        useCase = Exercise7UseCaseMock()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise7ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isPremiumTrigger: isPremiumTrigger.asDriver(),
            cartAmount: cartAmount.asDriver(),
            isSelectQuickDeliver: isSelectQuickDeliver.asDriver()
        )
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTriggerInvoked() {
        self.useCase.calculationFeeValues = (0.0, 500.0)
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 0.0)
        XCTAssertEqual(output.fee.quickFee, 500.0)
    }
    
    func test_isPremiumTriggerInvoked() {
        self.useCase.calculationFeeValues = (0.0, 500.0)
        isPremiumTrigger.accept(true)
        
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 0.0)
        XCTAssertEqual(output.fee.quickFee, 500.0)
    }
    
    func test_cartAmountInvoked() {
        self.useCase.calculationFeeValues = (0.0, 500.0)
        cartAmount.accept("")
        
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 0.0)
        XCTAssertEqual(output.fee.quickFee, 500.0)
    }
    
    func test_isSelectQuickDeliverInvoked_loadHolidays() {
        self.useCase.calculationFeeValues = (0.0, 500.0)
        isSelectQuickDeliver.accept(true)
        
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 0.0)
        XCTAssertEqual(output.fee.quickFee, 500.0)
    }
    
    func test_cartAmountInvoked_success() {
        self.useCase.validateCardAmountValues = ValidationResult.success(())
        cartAmount.accept("240.0")

        XCTAssert(self.useCase.validateCardAmountCalled)
        XCTAssertEqual(output.errorMessage, "")
    }

    func test_cartAmountInvoked_error() {
        let error = "Must input number"
        self.useCase.validateCardAmountValues =  ValidationResult.failure(ValidationError(message: error))
        cartAmount.accept("")

        XCTAssert(self.useCase.validateCardAmountCalled)
        XCTAssertEqual(output.errorMessage, error)
    }
}
