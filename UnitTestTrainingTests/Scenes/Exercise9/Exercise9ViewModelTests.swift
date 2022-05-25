//
//  Exercise9ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import UnitTestTraining

class Exercise9ViewModelTests: XCTestCase {
    
    private var navigator: Exercise9NavigatorMock!
    private var useCase: Exercise9UseCaseMock!
    private var viewModel: Exercise9ViewModel!
    
    private var disposeBag: DisposeBag!
    
    private var input: Exercise9ViewModel.Input!
    private var output: Exercise9ViewModel.Output!
    
    private var magicWandSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private var strategistSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private var darknessKeySelectionTrigger = BehaviorRelay<Bool>(value: false)
    private var lightSwordSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private var hitBigBossTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise9NavigatorMock()
        useCase = Exercise9UseCaseMock()
        viewModel = Exercise9ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise9ViewModel.Input(
            magicWandSelectionTrigger: magicWandSelectionTrigger.asDriver(),
            strategistSelectionTrigger: strategistSelectionTrigger.asDriver(),
            darknessKeySelectionTrigger: darknessKeySelectionTrigger.asDriver(),
            lightSwordSelectionTrigger: lightSwordSelectionTrigger.asDriver(),
            hitBigBossTrigger: hitBigBossTrigger.asDriverOnErrorJustComplete()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_hitBigBossTrigger() {
        self.useCase.calculateHanoiQuestValue = HanoiQuestResult.beatBigBoss
        
        magicWandSelectionTrigger.accept(true)
        strategistSelectionTrigger.accept(true)
        darknessKeySelectionTrigger.accept(true)
        lightSwordSelectionTrigger.accept(true)
        hitBigBossTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateHanoiQuestCalled)
        XCTAssertEqual(output.gameResult, .beatBigBoss)
    }
    
}
