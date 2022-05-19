//
//  Exercise4ViewModelTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa


final class Exercise4ViewModelTest: XCTestCase {
    private var viewModel: Exercise4ViewModel!
    private var useCase: Exercise4UseCaseMock!
    private var navigator: Exercise4NavigatorMock!
    
    private var input: Exercise4ViewModel.Input!
    private var output: Exercise4ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let dateTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        useCase = Exercise4UseCaseMock()
        navigator = Exercise4NavigatorMock()
        
        viewModel = Exercise4ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise4ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            dateTrigger: dateTrigger.asDriver())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger() {
        loadTrigger.onNext(())
        XCTAssert(useCase.getDateColorCalled)
        XCTAssert(useCase.getHolidaysCalled)
    }
    
    func test_dateTrigger() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime = formatter.date(from: "2022/05/19")
        useCase.getHolidaysValues.append(someDateTime!)
        
        loadTrigger.onNext(())
        XCTAssertEqual(output.currentDate.dayInWeek(), someDateTime?.dayInWeek())
    }

    func test_Output() {
        useCase.getHolidaysValues = [Date()]
        useCase.getDateColors = .red
        loadTrigger.onNext(())
        
        XCTAssertEqual(output.currentDate.dayInWeek(), useCase.getHolidaysValues[0].dayInWeek())
        XCTAssertEqual(output.dateColor, UIColor.red)
    }
}
