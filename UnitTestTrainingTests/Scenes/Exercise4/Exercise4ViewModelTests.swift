//
//  Exercise4ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import UnitTestTraining

class Exercise4ViewModelTests: XCTestCase {
    
    var navigator: Exercise4NavigatorMock!
    var useCase: Exercise4UseCaseMock!
    var viewModel: Exercise4ViewModel!
    
    var input: Exercise4ViewModel.Input!
    var output: Exercise4ViewModel.Output!
    
    var disposeBag: DisposeBag!
    
    var loadTrigger = PublishSubject<Void>()
    var dateTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        navigator = Exercise4NavigatorMock()
        useCase = Exercise4UseCaseMock()
        viewModel = Exercise4ViewModel(navigator: navigator, useCase: useCase)
        
        disposeBag = DisposeBag()
        
        input = Exercise4ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            dateTrigger: dateTrigger.asDriver()
        )
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTriggerInvoked_getHolidays() {
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.getHolidaysCalled)
    }
    
    func test_dateTriggerInvoked_getDateColor() {
        self.useCase.getDateColorValue = .red
        dateTrigger.accept(Date())
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.getDateColorCalled)
        XCTAssertEqual(output.dateColor, .red)
    }
    
}
