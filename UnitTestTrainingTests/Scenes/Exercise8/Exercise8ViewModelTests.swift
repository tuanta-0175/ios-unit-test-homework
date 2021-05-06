//
//  Exercise8ViewModelTests.swift
//  UnitTestTraining
//
//  Created by pham.van.thinh on 06/05/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//
@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto
import ValidatedPropertyKit

final class Exercise8ViewModelTests: XCTestCase {
    private var viewModel: Exercise8ViewModel!
    private var navigator: Exercise8NavigatorMock!
    private var useCase: Exercise8UseCaseMock!

    private var input: Exercise8ViewModel.Input!
    private var output: Exercise8ViewModel.Output!

    private var disposeBag: DisposeBag!

    private let loadTrigger = PublishSubject<Void>()
    private let ageTrigger = PublishSubject<String>()
    private let isMaleTrigger = PublishSubject<Bool>()
    private let dateTrigger = PublishSubject<Date>()

    override func setUp() {
        super.setUp()
        navigator = Exercise8NavigatorMock()
        useCase = Exercise8UseCaseMock()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise8ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            ageTrigger: ageTrigger.asDriverOnErrorJustComplete(),
            isMaleTrigger: isMaleTrigger.asDriverOnErrorJustComplete(),
            dateTrigger: dateTrigger.asDriverOnErrorJustComplete()
        )

        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }

    func test_loadTrigger() {
        // act
        loadTrigger.onNext(())

        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }

    func test_ageTrigger_valid() {
        // act
        ageTrigger.onNext("")

        // assert
        XCTAssert(useCase.validateAgeCalled)
    }

    func test_ageTrigger_invalid() {
        // arange
        useCase.validateAgeReturnValue = ValidationResult.failure(ValidationError(message: "error"))

        // act
        ageTrigger.onNext("")

        // assert
        XCTAssert(useCase.validateAgeCalled)
    }

    func test_isMaleTrigger_male() {
        // act
        isMaleTrigger.onNext(true)

        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }

    func test_isMaleTrigger_female() {
        // act
        isMaleTrigger.onNext(false)

        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }

    func test_dateTrigger() {
        // act
        dateTrigger.onNext(Date())

        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }

}
