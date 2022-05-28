//
//  Exercise10ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 28/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise10ViewModelTests: XCTestCase {
    private var viewModel: Exercise10ViewModel!
    private var navigator: Exercise10NavigatorMock!
    private var useCase: Exercise10UseCaseMock!
    private var input: Exercise10ViewModel.Input!
    private var output: Exercise10ViewModel.Output!
    private var disposeBag: DisposeBag!

    private let loadTrigger = PublishSubject<Void>()
    private let memberRankTrigger = BehaviorRelay<Int>(value: Int())
    private let prepaidTypeTrigger = BehaviorRelay<Int>(value: Int())
    private let participateLotteryTrigger = BehaviorRelay<Bool>(value: true)

    override func setUp() {
        super.setUp()
        navigator = Exercise10NavigatorMock()
        useCase = Exercise10UseCaseMock()
        viewModel = Exercise10ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise10ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            memberRankTrigger: memberRankTrigger.asDriver(),
            prepaidTypeTrigger: prepaidTypeTrigger.asDriver(),
            participateLotteryTrigger: participateLotteryTrigger.asDriver()
        )
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger() {
        self.useCase.calculateRestaurantPromotionValue = RestaurantPromotion(discount: 2, haveCoupon: true)
        loadTrigger.onNext(())
        
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
        XCTAssertEqual(output.restaurantPromotion.discount, 2)
        XCTAssertEqual(output.restaurantPromotion.haveCoupon, true)
    }
    
    func test_memberRankTrigger() {
        self.useCase.calculateRestaurantPromotionValue = RestaurantPromotion(discount: 2, haveCoupon: true)
        memberRankTrigger.accept(0)
        
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
        XCTAssertEqual(output.restaurantPromotion.discount, 2)
        XCTAssertEqual(output.restaurantPromotion.haveCoupon, true)
    }
    
    func test_prepaidTypeTrigger() {
        self.useCase.calculateRestaurantPromotionValue = RestaurantPromotion(discount: 2, haveCoupon: true)
        prepaidTypeTrigger.accept(0)
        
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
        XCTAssertEqual(output.restaurantPromotion.discount, 2)
        XCTAssertEqual(output.restaurantPromotion.haveCoupon, true)
    }
    
    func test_participateLotteryTrigger() {
        self.useCase.calculateRestaurantPromotionValue = RestaurantPromotion(discount: 2, haveCoupon: true)
        participateLotteryTrigger.accept(true)
        
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
        XCTAssertEqual(output.restaurantPromotion.discount, 2)
        XCTAssertEqual(output.restaurantPromotion.haveCoupon, true)
        XCTAssertEqual(output.availableToParticipateLottery, true)
    }
}
