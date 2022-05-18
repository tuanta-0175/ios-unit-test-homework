//
//  Exercise1UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise1UseCaseMock: Exercise1UseCaseType {
    var calculateBeerPriceValues: Double = 0
    var calculateBeerPrice = false
    func calculateBeerPrice(dto: BeerOrderDto) -> Double {
        calculateBeerPrice = true
        return calculateBeerPriceValues
    }
    
    
}
