//
//  Exercise9ViewModelTest.swift
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

final class Exercise9ViewModelTest: XCTestCase {
    private var viewModel: Exercise9ViewModel!
    private var useCase: Exercise9UseCaseMock!
    private var navigator: Exercise9NavigatorMock!
    private var disposeBag: DisposeBag!
    
    private var output: Exercise9ViewModel.Output!
    private var input: Exercise9ViewModel.Input!
    
    private let magicWandSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private let strategistSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private let darknessKeySelectionTrigger = BehaviorRelay<Bool>(value: false)
    private let lightSwordSelectionTrigger = BehaviorRelay<Bool>(value: false)
    private let hitBigBossTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        useCase = Exercise9UseCaseMock()
        navigator = Exercise9NavigatorMock()
        disposeBag = DisposeBag()
        viewModel = Exercise9ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise9ViewModel.Input(magicWandSelectionTrigger: magicWandSelectionTrigger.asDriver(),
                                         strategistSelectionTrigger: strategistSelectionTrigger.asDriver(),
                                         darknessKeySelectionTrigger: darknessKeySelectionTrigger.asDriver(),
                                         lightSwordSelectionTrigger: lightSwordSelectionTrigger.asDriver(),
                                         hitBigBossTrigger: hitBigBossTrigger.asDriverOnErrorJustComplete())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_calculateHanoiQuestCalled() {
        hitBigBossTrigger.onNext(())
        XCTAssert(useCase.calculateHanoiQuestCalled)
    }
    
    func test_outputGameResult() {
        useCase.calculateHanoiQuestValues = HanoiQuestResult.beatBigBoss
        hitBigBossTrigger.onNext(())
        XCTAssertEqual(useCase.calculateHanoiQuestValues, output.gameResult)
    }
}
