//
//  Exercise1ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise1ViewModelTests: XCTestCase {
    private var viewModel: Exercise1ViewModel!
    private var useCase: Exercise1UseCaseMock!
    private var navigation: Exercise1NavigatorMock!
    
    private var input: Exercise1ViewModel.Input!
    private var output: Exercise1ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let isVoucherTrigger = BehaviorRelay<Bool>(value: true)
    private let dateTrigger = BehaviorRelay<Date>(value: Date())
    private let loadTrigger = PublishSubject<Void>()
    private let calculateBeerPrice = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        
        useCase = Exercise1UseCaseMock()
        navigation = Exercise1NavigatorMock()
        viewModel = Exercise1ViewModel(navigator: navigation, useCase: useCase)
        
        input = Exercise1ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            voucherTrigger: isVoucherTrigger.asDriver(),
            purchaseTimeTrigger: dateTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_calculateBeerPrice() {
        loadTrigger.onNext(())
        XCTAssert(self.useCase.calculateBeerPrice)
    }
    
    func testOutPut() {
        self.useCase.calculateBeerPriceValues = 13
        loadTrigger.onNext(())
        XCTAssertEqual(self.useCase.calculateBeerPriceValues, 13)
        XCTAssertEqual(output.price, (13).japanCurrency)
    }
    
}
