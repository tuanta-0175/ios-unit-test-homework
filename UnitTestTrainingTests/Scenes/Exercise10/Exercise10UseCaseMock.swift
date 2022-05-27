//
//  Exercise10UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class Exercise10UseCaseMock: Exercise10UseCaseType {
    
    var restaurantPromotionCalled = false
    var restaurantPromotionValues = RestaurantPromotion(discount: 0, haveCoupon: false)
    
    func calculateRestaurantPromotion(dto: RestaurantPromotionDto) -> RestaurantPromotion {
        restaurantPromotionCalled = true
        return restaurantPromotionValues
    }
}
