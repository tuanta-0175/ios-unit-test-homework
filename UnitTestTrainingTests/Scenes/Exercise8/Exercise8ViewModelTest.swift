//
//  Exercise8ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto

final class Exercise8ViewModelTest: XCTestCase {
    
    private var viewModel: Exercise8ViewModel!
    private var useCase: Exercise8UseCaseMock!
    private var navigator: Exercise8NavigatorMock!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise8ViewModel.Input!
    private var output: Exercise8ViewModel.Output!
    
    private let loadTrigger = PublishSubject<Void>()
    private let ageTrigger = BehaviorRelay<String>(value: "")
    private let isMaleTrigger = BehaviorRelay<Bool>(value: false)
    private let dateTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        useCase = Exercise8UseCaseMock()
        navigator = Exercise8NavigatorMock()
        disposeBag = DisposeBag()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise8ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         ageTrigger: ageTrigger.asDriver(),
                                         isMaleTrigger: isMaleTrigger.asDriver(),
                                         dateTrigger: dateTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    
    func test_validateAgeCalled() {
        ageTrigger.accept("13")
        XCTAssert(useCase.validateAgeCalled)
    }
    
    func test_calculatePlayFeeCalled() {
        loadTrigger.onNext(())
        XCTAssert(useCase.calculatePlayFeeCalled)
    }
    
    func test_outputErrorMessage() {
        useCase.validateAgeValue = ValidationResult.failure("Error Age")
        ageTrigger.accept("0")
        XCTAssertEqual("Error Age", output.errorMessage)
    }
    
    func test_outputGender() {
        isMaleTrigger.accept(false)
        
        XCTAssertEqual("Nữ", output.genderString)
    }
    
    func test_outputFee() {
        useCase.calculatePlayFeeValues = 199
        loadTrigger.onNext(())
        
        XCTAssertEqual(199, output.fee)
    }
}
