//
//  Exercise1UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise1UseCaseMock: Exercise1UseCaseType {
    var calculateBeerPriceCalled = false
    var calculateBeerPriceValues: Double = 0
    
    func calculateBeerPrice(dto: BeerOrderDto) -> Double {
        calculateBeerPriceCalled = true
        return calculateBeerPriceValues
    }
}
