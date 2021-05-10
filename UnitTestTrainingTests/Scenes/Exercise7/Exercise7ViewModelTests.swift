//
//  Exercise7ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by dong son on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
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
    private let isPremiumTrigger = PublishSubject<Bool>()
    private let cartAmount = PublishSubject<String>()
    private let isSelectQuickDeliver = PublishSubject<Bool>()

    override func setUp() {
        super.setUp()
        navigator = Exercise7NavigatorMock()
        useCase = Exercise7UseCaseMock()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise7ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isPremiumTrigger: isPremiumTrigger.asDriverOnErrorJustComplete(),
            cartAmount: cartAmount.asDriverOnErrorJustComplete(),
            isSelectQuickDeliver: isSelectQuickDeliver.asDriverOnErrorJustComplete()
        )

        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }

    func test_loadTrigger() {
        // act
        loadTrigger.onNext(())

        // assert
        XCTAssert(self.useCase.calculationFeeCalled)
        XCTAssertEqual(output.fee.standardFee, 500.0)
    }

    func test_isPremiumTrigger() {
        // act
        isPremiumTrigger.onNext(true)

        // assert
        XCTAssert(self.useCase.calculationFeeCalled)
    }

    func test_cartAmount() {
        // act
        cartAmount.onNext("6000.0")

        // assert
        XCTAssert(useCase.validateCardAmountCalled)
    }

    func test_cartAmount_showError() {
        // arrange
        useCase.validateCardAmountReturnValue = ValidationResult.failure(ValidationError(message: "error"))
        output = viewModel.transform(input, disposeBag: disposeBag)

        // act
        cartAmount.onNext("test")

        // assert
        XCTAssertEqual(output.errorMessage, "error")
    }

    func test_isSelectQuickDeliver_() {
        // act
        isSelectQuickDeliver.onNext(true)

        // assert
        XCTAssert(true)
    }
}
