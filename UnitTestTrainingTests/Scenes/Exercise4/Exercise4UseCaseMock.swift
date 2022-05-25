//
//  Exercise4UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import RxSwift
import XCTest
@testable import UnitTestTraining

final class Exercise4UseCaseMock: Exercise4UseCaseType {
    
    // MARK: getHolidays
    var getHolidaysCalled = false
    var getHolidaysValues = [Date()]
    
    func getHolidays() -> [Date] {
        getHolidaysCalled = true
        return getHolidaysValues
    }
    
    // MARK: getDateColor
    var getDateColorCalled = false
    var getDateColorValue = UIColor.black
    
    func getDateColor(dto: GetDateColorDto) -> UIColor {
        getDateColorCalled = true
        return getDateColorValue
    }
    
}
