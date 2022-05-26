//
//  Exercise10UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise10UseCaseMock: XCTestCase, Exercise10UseCaseType {
    
    var calculateRestaurantPromotionCalled = false
    var calculateRestaurantPromotionValue = RestaurantPromotion(discount: 1, haveCoupon: false)
    
    func calculateRestaurantPromotion(dto: RestaurantPromotionDto) -> RestaurantPromotion {
        calculateRestaurantPromotionCalled = true
        return calculateRestaurantPromotionValue
    }
    
}
