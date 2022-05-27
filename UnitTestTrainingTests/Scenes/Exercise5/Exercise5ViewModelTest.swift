//
//  Exercise5ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto

final class Exercise5ViewModelTest: XCTestCase {
    
    private var viewModel: Exercise5ViewModel!
    private var useCase: Exercise5UseCaseMock!
    private var nagigator: Exercise5NavigatorMock!
    
    private var input: Exercise5ViewModel.Input!
    private var output: Exercise5ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let priceTrigger = BehaviorRelay<String>(value: "")
    private let receiveMethodTrigger = BehaviorRelay<Int>(value: 0)
    private let usingCouponTrigger = BehaviorRelay<Bool>(value: false)
    private let intoMoneyTrigger = PublishSubject<Void>()
 
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        useCase = Exercise5UseCaseMock()
        nagigator = Exercise5NavigatorMock()
        
        viewModel = Exercise5ViewModel(navigator: nagigator, useCase: useCase)
        
        input = Exercise5ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            priceTrigger: priceTrigger.asDriver(),
            receiveMethodTrigger: receiveMethodTrigger.asDriver(),
            usingCouponTrigger: usingCouponTrigger.asDriver(),
            intoMoneyTrigger: intoMoneyTrigger.asDriverOnErrorJustComplete())
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_priceTrigger() {
        priceTrigger.accept("1500")
        XCTAssert(useCase.validatePizzaPriceCalled)
    }
    
    func test_intoMoneyTrigger() {
        intoMoneyTrigger.onNext(())
        XCTAssert(useCase.calculateFeeCalled)
    }
    
    func test_receiveMethodTrigger() {
        receiveMethodTrigger.accept(1)
        XCTAssert(output.isHiddenUsingCoupon)
        
    }
    
    func test_output_errorMessage() {
        useCase.validationResult = ValidationResult.failure("Error Message")
        priceTrigger.accept("100")
        XCTAssertEqual("Error Message", output.errorMessage)
    }
    
    func test_output_fee() {
        useCase.calculateFeeValue.fee = 100
        intoMoneyTrigger.onNext(())
        
        XCTAssertEqual(output.fee.fee, useCase.calculateFeeValue.fee)
    }
}
