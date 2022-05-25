//
//  Exercise8ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
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
    private let ageTrigger = BehaviorRelay<String>(value: String())
    private let isMaleTrigger = BehaviorRelay<Bool>(value: true)
    private let dateTrigger = BehaviorRelay<Date>(value: Date())

    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise8NavigatorMock()
        useCase = Exercise8UseCaseMock()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise8ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            ageTrigger: ageTrigger.asDriver(),
            isMaleTrigger: isMaleTrigger.asDriver(),
            dateTrigger: dateTrigger.asDriver()
        )
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_ageTriggerInvoked_success() {
        self.useCase.validateAgeValues = ValidationResult.success(())
        ageTrigger.accept("68")

        XCTAssert(self.useCase.validateAgeCalled)
        XCTAssertEqual(output.errorMessage, "")
    }

    func test_ageTriggerInvoked_error() {
        let error = "Độ tuổi từ 0 - 120 tuổi"
        self.useCase.validateAgeValues =  ValidationResult.failure(ValidationError(message: error))
        ageTrigger.accept("")

        XCTAssert(self.useCase.validateAgeCalled)
        XCTAssertEqual(output.errorMessage, error)
    }
    
    func test_loadTriggerInvoked() {
        self.useCase.calculatePlayFeeValues = 900.0
        loadTrigger.onNext(())

        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.fee, 900.0)
    }

    func test_ageTriggerInvoked() {
        self.useCase.calculatePlayFeeValues = 900.0
        ageTrigger.accept("")

        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.fee, 900.0)
    }

    func test_isMaleTriggerInvoked() {
        self.useCase.calculatePlayFeeValues = 900.0
        isMaleTrigger.accept(true)

        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.fee, 900.0)
    }

    func test_isSelectQuickDeliverInvoked_loadHolidays() {
        self.useCase.calculatePlayFeeValues = 900.0
        dateTrigger.accept(Date())

        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.fee, 900.0)
    }
    
    func test_isMaleTriggerInvoked_genderString() {
        isMaleTrigger.accept(true)

        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.genderString, "Nam")
    }
}
