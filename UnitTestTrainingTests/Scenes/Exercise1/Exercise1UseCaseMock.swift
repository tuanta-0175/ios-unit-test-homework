//
//  Exercise1UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class Exercise1UseCaseMock: Exercise1UseCaseType {
    
    var calculateBeerPriceCalled = false
    var calculateBeerPriceValue = 0.0
    
    func calculateBeerPrice(dto: BeerOrderDto) -> Double {
        calculateBeerPriceCalled = true
        return calculateBeerPriceValue
    }
    
}
