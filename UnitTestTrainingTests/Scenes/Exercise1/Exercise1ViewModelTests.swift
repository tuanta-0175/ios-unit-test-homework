//
//  Exercise1ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise1ViewModelTests: XCTestCase {
    private var viewModel: Exercise1ViewModel!
    private var navigator: Exercise1NavigatorMock!
    private var useCase: Exercise1UseCaseMock!
    
    private var input: Exercise1ViewModel.Input!
    private var output: Exercise1ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let voucherTrigger = BehaviorRelay<Bool>(value: true)
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
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateBeerPriceCalled)
    }
}
