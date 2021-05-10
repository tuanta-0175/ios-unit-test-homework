//
//  Exercise7ViewModelTests.swift
//  DALi
//
//  Created by bui.van.hung on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxCocoa
import RxSwift
import XCTest
import Dto
import ValidatedPropertyKit

final class Exercise7ViewModelTests: XCTestCase {
    private var viewModel: Exercise7ViewModel!
    private var navigator: Exercise7NavigatorMock!
    private var useCase: Exercise7UseCaseMock!
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!
    private var disposeBag: DisposeBag!
    
    // Triggers
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
    }
    
    func test_isPremiumTrigger() {
        // act
        isPremiumTrigger.onNext(true)
        
        // assert
        XCTAssert(self.useCase.calculationFeeCalled)
    }
    
    func test_cartAmount() {
        // act
        cartAmount.onNext("5000.0")
        
        // assert
        XCTAssert(useCase.validateCardAmountCalled)
    }
    
    func test_cartAmountError_showError() {
        // arrange
        useCase.validateCardAmountReturnValue = ValidationResult.failure(ValidationError(message: "error"))
        output = viewModel.transform(input, disposeBag: disposeBag)
        
        // act
        cartAmount.onNext("")
        
        // assert
        XCTAssertEqual(output.errorMessage, "error")
    }
    
    func test_selectQuickDeliver() {
        // act
        isSelectQuickDeliver.onNext(true)
        
        // assert
        XCTAssert(true)
    }
}
