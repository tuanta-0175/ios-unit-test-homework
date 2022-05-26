//
//  Exercise10ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import UnitTestTraining

class Exercise10ViewModelTests: XCTestCase {
    
    private var navigator: Exercise10NavigatorMock!
    private var useCase: Exercise10UseCaseMock!
    private var viewModel: Exercise10ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise10ViewModel.Input!
    private var output: Exercise10ViewModel.Output!
    
    private var loadTrigger = PublishSubject<Void>()
    private var memberRankTrigger = BehaviorRelay<Int>(value: 0)
    private var prepaidTypeTrigger = BehaviorRelay<Int>(value: 0)
    private var participateLotteryTrigger = BehaviorRelay<Bool>(value: false)
    
    override func setUp() {
        super.setUp()
        navigator = Exercise10NavigatorMock()
        useCase = Exercise10UseCaseMock()
        viewModel = Exercise10ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise10ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            memberRankTrigger: memberRankTrigger.asDriver(),
            prepaidTypeTrigger: prepaidTypeTrigger.asDriver(),
            participateLotteryTrigger: participateLotteryTrigger.asDriver()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_calculateRestaurantPromotion() {
        self.useCase.calculateRestaurantPromotionValue = RestaurantPromotion(discount: 15, haveCoupon: true)
        
        memberRankTrigger.accept(0)
        prepaidTypeTrigger.accept(0)
        participateLotteryTrigger.accept(false)
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateRestaurantPromotionCalled)
        XCTAssertEqual(output.restaurantPromotion.discount, 15)
        XCTAssertEqual(output.restaurantPromotion.haveCoupon, true)
        XCTAssertEqual(output.availableToParticipateLottery, true)
    }
    
}
