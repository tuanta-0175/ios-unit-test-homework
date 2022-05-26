//
//  Exercise8ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

class Exercise8ViewModelTests: XCTestCase {
    
    private var navigator: Exercise8NavigatorMock!
    private var useCase: Exercise8UseCaseMock!
    private var viewModel: Exercise8ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise8ViewModel.Input!
    private var output: Exercise8ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var ageTrigger = BehaviorRelay<String>(value: "")
    private var isMaleTrigger = BehaviorRelay<Bool>(value: false)
    private var dateTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        navigator = Exercise8NavigatorMock()
        useCase = Exercise8UseCaseMock()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise8ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            ageTrigger: ageTrigger.asDriver(),
            isMaleTrigger: isMaleTrigger.asDriver(),
            dateTrigger: dateTrigger.asDriver()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_ageTrigger_success() {
        self.useCase.validateAgeValue = ValidationResult.success(())
        ageTrigger.accept("")
        XCTAssert(self.useCase.validateAgeCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    func test_ageTrigger_failure() {
        let errorMessage = "Độ tuổi từ 0 - 120 tuổi"
        
        self.useCase.validateAgeValue = ValidationResult.failure(ValidationError(message: errorMessage))
        ageTrigger.accept("")
        
        XCTAssert(self.useCase.validateAgeCalled)
        XCTAssertEqual(output.errorMessage, errorMessage)
    }
    
    func test_calculatePlayFee() {
        self.useCase.calculatePlayFeeValue = 1800.0
        
        ageTrigger.accept("25")
        isMaleTrigger.accept(true)
        dateTrigger.accept(Date())
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculatePlayFeeCalled)
        XCTAssertEqual(output.fee, 1800.0)
        XCTAssertEqual(output.genderString, "Nam")
    }
    
}
