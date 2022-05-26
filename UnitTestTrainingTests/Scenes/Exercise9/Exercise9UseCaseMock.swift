//
//  Exercise9UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise9UseCaseMock: XCTestCase, Exercise9UseCaseType {
    
    var calculateHanoiQuestCalled = false
    var calculateHanoiQuestValue = HanoiQuestResult.roomNotFound
    
    func calculateHanoiQuestResult(dto: HanoiQuestDto) -> HanoiQuestResult {
        calculateHanoiQuestCalled = true
        return calculateHanoiQuestValue
    }
    
}
