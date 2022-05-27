//
//  Exercise10ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import Dto

final class Exercise10ViewModelTest: XCTestCase {
    private var viewModel: Exercise10ViewModel!
    private var useCase: Exercise10UseCaseMock!
    private var navigator: Exercise10NavigatorMock!
    private var disposeBag: DisposeBag!
    
    private var input: Exercise10ViewModel.Input!
    private var output: Exercise10ViewModel.Output!
    
    private let loadTrigger = PublishSubject<Void>()
    private let memberRankTrigger = BehaviorRelay<Int>(value: 0)
    private let prepaidTypeTrigger = BehaviorRelay<Int>(value: 0)
    private let participateLotteryTrigger = BehaviorRelay<Bool>(value: false)
    
    override func setUp() {
        super.setUp()
        useCase = Exercise10UseCaseMock()
        navigator = Exercise10NavigatorMock()
        disposeBag = DisposeBag()
        
        viewModel = Exercise10ViewModel(navigator: navigator, useCase: useCase)
        input = Exercise10ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                          memberRankTrigger: memberRankTrigger.asDriver(),
                                          prepaidTypeTrigger: prepaidTypeTrigger.asDriver(),
                                          participateLotteryTrigger: participateLotteryTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_restaurantPromotionCalled() {
        loadTrigger.onNext(())
        XCTAssert(useCase.restaurantPromotionCalled)
    }
    
    func test_outputRestaurantPromotion() {
        useCase.restaurantPromotionValues = RestaurantPromotion(discount: 11, haveCoupon: true)
        loadTrigger.onNext(())
        
        XCTAssertEqual(11, output.restaurantPromotion.discount)
    }
    
    func test_outputAvailableToParticipateLottery() {
        useCase.restaurantPromotionValues = RestaurantPromotion(discount: 2, haveCoupon: true)
        loadTrigger.onNext(())
        XCTAssert(output.availableToParticipateLottery)
    }
}
