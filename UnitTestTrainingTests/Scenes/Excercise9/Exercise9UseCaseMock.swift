//
//  Exercise9UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift

final class Exercise9UseCaseMock: Exercise9UseCaseType {
    var calculateHanoiQuestResultCalled = false
    var calculateHanoiQuestResultValues = HanoiQuestResult.roomNotFound
    
    func calculateHanoiQuestResult(dto: HanoiQuestDto) -> HanoiQuestResult {
        calculateHanoiQuestResultCalled = true
        return calculateHanoiQuestResultValues
    }
}
