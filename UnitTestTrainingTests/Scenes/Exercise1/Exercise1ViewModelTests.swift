//
//  Exercise1ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import UnitTestTraining

final class Exercise1ViewModelTests: XCTestCase {
    
    private var viewModel: Exercise1ViewModel!
    private var navigator: Exercise1NavigatorMock!
    private var useCase: Exercise1UseCaseMock!
    
    private var input: Exercise1ViewModel.Input!
    private var output: Exercise1ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let voucherTrigger = BehaviorRelay<Bool>(value: false)
    private let purchaseTimeTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise1NavigatorMock()
        useCase = Exercise1UseCaseMock()
        viewModel = Exercise1ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise1ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            voucherTrigger: voucherTrigger.asDriver(),
            purchaseTimeTrigger: purchaseTimeTrigger.asDriver()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTriggerInvoked_calculateBeerPrice() {
        self.useCase.calculateBeerPriceValue = 490.0
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateBeerPriceCalled)
        XCTAssertEqual(output.price, (490.0).japanCurrency)
    }
    
    func test_voucherTriggerInvoked_calculateBeerPrice() {
        self.useCase.calculateBeerPriceValue = 100.0
        voucherTrigger.accept(true)
        
        XCTAssert(self.useCase.calculateBeerPriceCalled)
        XCTAssertEqual(output.price, (100.0).japanCurrency)
    }
    
    func test_purchaseTimeTriggerInvoked_calculateBeerPrice() {
        self.useCase.calculateBeerPriceValue = 290.0
        purchaseTimeTrigger.accept(Date())
        
        XCTAssert(self.useCase.calculateBeerPriceCalled)
        XCTAssertEqual(output.price, (290.0).japanCurrency)
    }
    
}
