//
//  Exercise7ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 19/04/2021.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise7ViewModelTests: XCTestCase {
    private var viewModel: Exercise7ViewModel!
    private var navigator: Exercise7NavigatorMock!
    private var useCase: Exercise7UseCaseMock!
    
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var isPremiumTrigger = PublishSubject<Bool>()
    private var cartAmountTrigger = PublishSubject<String>()
    private var isSelecQuickDeliverTrigger = PublishSubject<Bool>()
    
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        navigator = Exercise7NavigatorMock()
        useCase = Exercise7UseCaseMock()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise7ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         isPremiumTrigger: isPremiumTrigger.asDriverOnErrorJustComplete(),
                                         cartAmount: cartAmountTrigger.asDriverOnErrorJustComplete(),
                                         isSelectQuickDeliver: isSelecQuickDeliverTrigger.asDriverOnErrorJustComplete())
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_cartAmountTrigger_validate() {
        // arange
        
        // act
        cartAmountTrigger.onNext("")
        
        // assert
        XCTAssert(useCase.validateCardAmounntCalled)
    }
    
    func test_calculationFee_loadTrigger() {
        // arange
        
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculationFeeCalled)
    }
    
    func test_calculationFee_isPremiumTrigger() {
        // arange
        
        // act
        isPremiumTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculationFeeCalled)
    }
    
    func test_calculationFee_cartAmountTrigger() {
        // arange
        
        // act
        cartAmountTrigger.onNext("")
        
        // assert
        XCTAssert(useCase.calculationFeeCalled)
    }
    
    func test_calculationFee_isSelecQuickDeliverTrigger() {
        // arange
        
        // act
        isSelecQuickDeliverTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculationFeeCalled)
    }
}
