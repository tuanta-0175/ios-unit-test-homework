//
//  Exercise5ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise5ViewModelTests: XCTestCase {
    private var viewModel: Exercise5ViewModel!
    private var navigator: Exercise5NavigatorMock!
    private var useCase: Exercise5UseCaseMock!
    
    private var input: Exercise5ViewModel.Input!
    private var output: Exercise5ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let priceTrigger = BehaviorRelay<String>(value: String())
    private let receiveMethodTrigger = BehaviorRelay<Int>(value: Int())
    private let usingCouponTrigger = BehaviorRelay<Bool>(value: true)
    private let intoMoneyTrigger = PublishSubject<Void>()

    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise5NavigatorMock()
        useCase = Exercise5UseCaseMock()
        viewModel = Exercise5ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise5ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            priceTrigger: priceTrigger.asDriver(),
            receiveMethodTrigger: receiveMethodTrigger.asDriver(),
            usingCouponTrigger: usingCouponTrigger.asDriver(),
            intoMoneyTrigger: intoMoneyTrigger.asDriverOnErrorJustComplete()
        )
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_priceTriggerInvoked() {
        self.useCase.validatePizzaPriceValue = ValidationResult.success(())
        priceTrigger.accept("")
        
        XCTAssert(self.useCase.validatePizzaPriceCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    func test_priceTriggerInvoked_error() {
        let error = "Giá thành phải lớn hơn 0"
        self.useCase.validatePizzaPriceValue = ValidationResult.failure(ValidationError.init(message: error))
        priceTrigger.accept("")
        
        XCTAssert(self.useCase.validatePizzaPriceCalled)
        XCTAssertEqual(output.errorMessage, error)
    }
    
    func test_receiveMethodTriggerInvoked() {
        let price = 1600.0
        let promotions = [ReceiveMethod.takeAway]
        self.useCase.calculateFeeValues = CalculatePizzaFeeResult(fee: price, promotions:
        receiveMethodTrigger.accept(0)
        
        XCTAssert(self.useCase.calculateFeeCalled)
        XCTAssertEqual(output.isHiddenUsingCoupon, promotions)
    }
    
    func test_usingCouponTriggerInvoked() {
        usingCouponTrigger.accept(true)
        
        XCTAssert(self.useCase.calculateFeeCalled)
    }
    
    func test_intoMoneyTriggerInvoked() {
        let price = 1600.0
        let promotions = [PromotionType.freePotato, PromotionType.freeOnMonday]
        self.useCase.calculateFeeValues = CalculatePizzaFeeResult(fee: price, promotions: promotions)
        intoMoneyTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateFeeCalled)
        XCTAssertEqual(output.fee.fee, price)
        XCTAssertEqual(output.fee.fee, promotions)
    }
}
