//
//  Exercise5ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import Dto
import ValidatedPropertyKit
@testable import UnitTestTraining

final class Exercise5ViewModelTests: XCTestCase {
    
    private var navigator: Exercise5NavigatorMock!
    private var useCase: Exercise5UseCaseMock!
    private var viewModel: Exercise5ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise5ViewModel.Input!
    private var output: Exercise5ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var priceTrigger = BehaviorRelay<String>(value: "")
    private var receiveMethodTrigger = BehaviorRelay<Int>(value: 0)
    private var usingCouponTrigger = BehaviorRelay<Bool>(value: false)
    private var intoMoneyTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise5NavigatorMock()
        useCase = Exercise5UseCaseMock()
        viewModel = Exercise5ViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        
        input = Exercise5ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            priceTrigger: priceTrigger.asDriver(),
            receiveMethodTrigger: receiveMethodTrigger.asDriver(),
            usingCouponTrigger: usingCouponTrigger.asDriver(),
            intoMoneyTrigger: intoMoneyTrigger.asDriverOnErrorJustComplete()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger() {
        loadTrigger.onNext(())
    }
    
    func test_priceTrigger() {
        self.useCase.validatePizzaPriceValue = ValidationResult.success(())
        priceTrigger.accept("")
        
        XCTAssert(self.useCase.validatePizzaPriceCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    func test_priceTrigger_error() {
        let errorMessage = "Giá thành phải lớn hơn 0"
        
        self.useCase.validatePizzaPriceValue = ValidationResult.failure(ValidationError.init(message: errorMessage))
        priceTrigger.accept("")

        XCTAssert(self.useCase.validatePizzaPriceCalled)
        XCTAssertEqual(output.errorMessage, errorMessage)
    }
    
    func test_intoMoneyTrigger() {
        let promotionValues: [PromotionType] = [.freePotato, .freeSecondPizza]
        
        self.useCase.calculateFeeValue = CalculatePizzaFeeResult(fee: 2000, promotions: promotionValues)
        intoMoneyTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateFeeCalled)
        XCTAssertEqual(output.fee.fee, 2000)
        XCTAssertEqual(output.fee.promotions, promotionValues)
    }
    
}
