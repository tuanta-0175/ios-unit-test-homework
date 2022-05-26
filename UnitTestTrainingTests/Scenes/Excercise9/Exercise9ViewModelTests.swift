//
//  Exercise9ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise9ViewModelTests: XCTestCase {
    private var viewModel: Exercise9ViewModel!
    private var navigator: Exercise9NavigatorMock!
    private var useCase: Exercise9UseCaseMock!
    private var input: Exercise9ViewModel.Input!
    private var output: Exercise9ViewModel.Output!
    private var disposeBag: DisposeBag!

    // Triggers
    private let magicWandSelectionTrigger = BehaviorRelay<Bool>(value: true)
    private let strategistSelectionTrigger = BehaviorRelay<Bool>(value: true)
    private let darknessKeySelectionTrigger = BehaviorRelay<Bool>(value: true)
    private let lightSwordSelectionTrigger = BehaviorRelay<Bool>(value: true)
    private let hitBigBossTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise9NavigatorMock()
        useCase = Exercise9UseCaseMock()
        viewModel = Exercise9ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise9ViewModel.Input(
            magicWandSelectionTrigger: magicWandSelectionTrigger.asDriver(),
            strategistSelectionTrigger: strategistSelectionTrigger.asDriver(),
            darknessKeySelectionTrigger: darknessKeySelectionTrigger.asDriver(),
            lightSwordSelectionTrigger: lightSwordSelectionTrigger.asDriver(),
            hitBigBossTrigger: hitBigBossTrigger.asDriverOnErrorJustComplete()
        )
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_hitBigBossTriggerInvoked() {
        self.useCase.calculateHanoiQuestResultValues = HanoiQuestResult.roomNotFound
        hitBigBossTrigger.onNext(())
        magicWandSelectionTrigger.accept(false)
        strategistSelectionTrigger.accept(false)
        magicWandSelectionTrigger.accept(false)
        lightSwordSelectionTrigger.accept(false)
        
        XCTAssert(self.useCase.calculateHanoiQuestResultCalled)
        XCTAssertEqual(output.gameResult, .roomNotFound)
    }
}
