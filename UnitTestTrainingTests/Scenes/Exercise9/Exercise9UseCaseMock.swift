//
//  Exercise9UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class Exercise9UseCaseMock: Exercise9UseCaseType {
    
    var calculateHanoiQuestCalled = false
    var calculateHanoiQuestValues = HanoiQuestResult.roomNotFound
    
    func calculateHanoiQuestResult(dto: HanoiQuestDto) -> HanoiQuestResult {
        calculateHanoiQuestCalled = true
        return calculateHanoiQuestValues
    }
    
}
