//
//  Exercise6ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto

final class Exercise6ViewModelTest: XCTestCase {
    private var viewModel: Exercise6ViewModel!
    private var useCase: Exercise6UseCaseMock!
    private var navigator: Exercise6NavigatorMock!
    
    private var input: Exercise6ViewModel.Input!
    private var output: Exercise6ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let isWatchMovieTrigger = BehaviorRelay<Bool>(value: false)
    private let moneySpentTrigger = BehaviorRelay<String>(value: "")
    
    override func setUp() {
        super.setUp()
        useCase = Exercise6UseCaseMock()
        navigator = Exercise6NavigatorMock()
        disposeBag = DisposeBag()
        
        viewModel = Exercise6ViewModel(navigator: navigator, useCase: useCase)
        input = Exercise6ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         isWatchMovieTrigger: isWatchMovieTrigger.asDriver(),
                                         moneySpentTrigger: moneySpentTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_isWatchMovieTrigger() {
        loadTrigger.onNext(())
        XCTAssert(useCase.calculateFreeMinutesCalled)
    }
    
    func test_moneySpentTrigger() {
        moneySpentTrigger.accept("100")
        XCTAssert(useCase.validateMoneyAmountCalled)
    }
    
    func test_outputErrorMessage() {
        useCase.validateMoneyAmountValue = ValidationResult.failure("Called Error")
        moneySpentTrigger.accept("100")
        
        XCTAssertEqual("Called Error", output.errorMessage)
    }
    
    func test_outputFreeMinutes() {
        useCase.calculateFreeMinutesValue = 200
        loadTrigger.onNext(())
        XCTAssertEqual("\(useCase.calculateFreeMinutesValue)", output.freeMinutes)
    }
    
    
}
