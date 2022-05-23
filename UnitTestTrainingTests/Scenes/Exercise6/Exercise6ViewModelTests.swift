//
//  Exercise6ViewModelTests.swift
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

final class Exercise6ViewModelTests: XCTestCase {
    
    private var navigator: Exercise6NavigatorMock!
    private var useCase: Exercise6UseCaseMock!
    private var viewModel: Exercise6ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise6ViewModel.Input!
    private var output: Exercise6ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var isWatchMovieTrigger = BehaviorRelay<Bool>(value: false)
    private var moneySpentTrigger = BehaviorRelay<String>(value: "")
    
    override func setUp() {
        super.setUp()
        navigator = Exercise6NavigatorMock()
        useCase = Exercise6UseCaseMock()
        viewModel = Exercise6ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise6ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(), isWatchMovieTrigger: isWatchMovieTrigger.asDriver(), moneySpentTrigger: moneySpentTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    private func test_moneySpentTrigger_success() {
        self.useCase.validateMoneyAmountValue = ValidationResult.success(())
        moneySpentTrigger.accept("100")
        XCTAssert(self.useCase.validateMoneyAmountCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    private func test_moneySpentTrigger_error() {
        let errorMessage = "Must input number"
        self.useCase.validateMoneyAmountValue = ValidationResult.failure(ValidationError(message: errorMessage))
        moneySpentTrigger.accept("")
        XCTAssert(self.useCase.validateMoneyAmountCalled)
        XCTAssertEqual(output.errorMessage, errorMessage)
    }
    
    private func test_calculateFreeMinutes() {
        self.useCase.calculateFreeMinutesValue = 300.0
        isWatchMovieTrigger.accept(true)
        moneySpentTrigger.accept("5000")
        loadTrigger.onNext(())
        XCTAssert(self.useCase.calculateFreeMinutesCalled)
        XCTAssertEqual(output.freeMinutes, String(300.0))
    }
    
}
