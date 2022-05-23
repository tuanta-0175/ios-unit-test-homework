//
//  Exercise6ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto
import ValidatedPropertyKit

final class Exercise6ViewModelTests: XCTestCase {
    private var viewModel: Exercise6ViewModel!
    private var navigator: Exercise6NavigatorMock!
    private var useCase: Exercise6UseCaseMock!
    
    private var input: Exercise6ViewModel.Input!
    private var output: Exercise6ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let isWatchMovieTrigger = BehaviorRelay<Bool>(value: true)
    private let moneySpentTrigger = BehaviorRelay<String>(value: String())

    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise6NavigatorMock()
        useCase = Exercise6UseCaseMock()
        viewModel = Exercise6ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise6ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isWatchMovieTrigger: isWatchMovieTrigger.asDriver(),
            moneySpentTrigger: moneySpentTrigger.asDriver()
        )
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTriggerInvoked() {
        self.useCase.calculateFreeMinutesValues = 240.0
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateFreeMinutesCalled)
        XCTAssertEqual(output.freeMinutes, "240.0")
    }
    
    func test_isWatchMovieTriggerInvoked() {
        self.useCase.calculateFreeMinutesValues = 240.0
        isWatchMovieTrigger.accept(true)
        
        XCTAssert(self.useCase.calculateFreeMinutesCalled)
        XCTAssertEqual(output.freeMinutes, "240.0")
    }
    
    func test_moneySpentTriggerInvoked() {
        self.useCase.calculateFreeMinutesValues = 240.0
        moneySpentTrigger.accept("")
        
        XCTAssert(self.useCase.calculateFreeMinutesCalled)
        XCTAssertEqual(output.freeMinutes, "240.0")
    }
    
    func test_moneySpentTriggerInvoked_success() {
        self.useCase.validateMoneyAmountValues = ValidationResult.success(())
        moneySpentTrigger.accept("240.0")

        XCTAssert(self.useCase.validateMoneyAmountCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    func test_moneySpentTriggerInvoked_error() {
        let error = "Must input number"
        self.useCase.validateMoneyAmountValues =  ValidationResult.failure(ValidationError(message: error))
        moneySpentTrigger.accept("")

        XCTAssert(self.useCase.validateMoneyAmountCalled)
        XCTAssertEqual(output.errorMessage, error)
    }
}
