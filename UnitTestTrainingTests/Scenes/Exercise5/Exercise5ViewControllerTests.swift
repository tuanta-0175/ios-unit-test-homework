//
//  Exercise5ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 20/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class Exercise5ViewControllerTests: XCTestCase {
    
    private var viewController: Exercise5ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise5ViewController.instantiate()
    }
    
    private func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.couponView)
        XCTAssertNotNil(viewController.priceTextField)
        XCTAssertNotNil(viewController.receiveMethodSegment)
        XCTAssertNotNil(viewController.usingCouponSwitch)
        XCTAssertNotNil(viewController.intoMoneyButton)
        XCTAssertNotNil(viewController.promotionView)
        XCTAssertNotNil(viewController.intoMoneyValueLabel)
        XCTAssertNotNil(viewController.discountButton)
        XCTAssertNotNil(viewController.potatoPromotionButton)
        XCTAssertNotNil(viewController.freeMondayPromotionButton)
        XCTAssertNotNil(viewController.errorMessageLabel)
    }
    
}
