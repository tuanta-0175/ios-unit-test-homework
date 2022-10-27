//
//  Exercise4UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto


final class Exercise4UseCaseMock: Exercise4UseCaseType {
    
    var getHolidaysCalled = false
    var getHolidaysValues = [Date()]
    func getHolidays() -> [Date] {
        getHolidaysCalled = true
        return getHolidaysValues
    }
    
    var getDateColorCalled = false
    var getDateColors = UIColor.red
    func getDateColor(dto: GetDateColorDto) -> UIColor {
        getDateColorCalled = true
        return getDateColors
    }
    
    
}
