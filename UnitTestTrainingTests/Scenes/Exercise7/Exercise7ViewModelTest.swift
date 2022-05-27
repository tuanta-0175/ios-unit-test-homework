//
//  Exercise7ModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto

final class Exercise7ViewModelTest: XCTestCase {
    private var viewModel: Exercise7ViewModel!
    private var useCase: Exercise7UseCaseMock!
    private var navigator: Exercise7NavigatorMock!
    
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let isPremiumTrigger = BehaviorRelay<Bool>(value: false)
    private let cartAmount = BehaviorRelay<String>(value: "")
    private let isSelectQuickDeliver = BehaviorRelay<Bool>(value: false)
    
    override func setUp() {
        super.setUp()
        
        useCase = Exercise7UseCaseMock()
        navigator = Exercise7NavigatorMock()
        disposeBag = DisposeBag()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)
        input = Exercise7ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         isPremiumTrigger: isPremiumTrigger.asDriver(),
                                         cartAmount: cartAmount.asDriver(),
                                         isSelectQuickDeliver: isSelectQuickDeliver.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_validateCardAmount_called() {
        cartAmount.accept("")
        XCTAssert(useCase.validateCardAmountCalled)
    }
    
    func test_calculationFee_called() {
        loadTrigger.onNext(())
        XCTAssert(useCase.calculationFeeCalled)
    }
    
    func test_errorMessage() {
        useCase.validateCardAmountValues = ValidationResult.failure("Validate Card Amount Failed")
        cartAmount.accept("100")
        XCTAssertEqual("Validate Card Amount Failed", output.errorMessage)
    }
    
    func test_outputFee() {
        useCase.feeValues = (standardFee: 13, quickFee: 14)
        loadTrigger.onNext(())
        XCTAssertEqual(13, output.fee.standardFee)
        XCTAssertEqual(14, output.fee.quickFee)
    }
    
}
