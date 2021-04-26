//
//  Exercise8ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 19/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise8ViewModelTests: XCTestCase {
    private var viewModel: Exercise8ViewModel!
    private var navigator: Exercise8NavigatorMock!
    private var useCase: Exercise8UseCaseMock!
    
    private var input: Exercise8ViewModel.Input!
    private var output: Exercise8ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var ageTrigger = PublishSubject<String>()
    private var isMaleTrigger = PublishSubject<Bool>()
    private var dateTrigger = PublishSubject<Date>()
    
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        navigator = Exercise8NavigatorMock()
        useCase = Exercise8UseCaseMock()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise8ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         ageTrigger: ageTrigger.asDriverOnErrorJustComplete(),
                                         isMaleTrigger: isMaleTrigger.asDriverOnErrorJustComplete(),
                                         dateTrigger: dateTrigger.asDriverOnErrorJustComplete())
        
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_validateAge() {
        ageTrigger.onNext("")
        
        XCTAssert(useCase.validateAgeCalled)
    }
    
    func test_calculatePlayFee_loadTrigger() {
        // arange
        
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }
    
    func test_calculatePlayFee_ageTrigger() {
        // arange
        
        // act
        ageTrigger.onNext("")
        
        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }
    
    func test_calculatePlayFee_isMaleTrigger() {
        // arange
        
        // act
        isMaleTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }
    
    func test_calculatePlayFee_dateTrigger() {
        // arange
        
        // act
        dateTrigger.onNext(Date(hour: 0) ?? Date())
        
        // assert
        XCTAssert(useCase.calculatePlayFeeCalled)
    }
}
