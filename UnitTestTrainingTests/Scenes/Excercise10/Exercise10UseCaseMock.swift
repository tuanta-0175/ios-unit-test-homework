//
//  Exercise10UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 28/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift

final class Exercise10UseCaseMock: Exercise10UseCaseType {
    var calculateRestaurantPromotionCalled = false
    var calculateRestaurantPromotionValue = RestaurantPromotion(discount: 0, haveCoupon: true)
    
    func calculateRestaurantPromotion(dto: RestaurantPromotionDto) -> RestaurantPromotion {
        calculateRestaurantPromotionCalled = true
        return calculateRestaurantPromotionValue
    }
}
