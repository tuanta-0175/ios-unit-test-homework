//
//  Exercise10ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise10ViewControllerTests: XCTestCase {
    
    private var viewController: Exercise10ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise10ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.participateLotteryView)
        XCTAssertNotNil(viewController.memberRankSegment)
        XCTAssertNotNil(viewController.prepaidCardTypeSegment)
        XCTAssertNotNil(viewController.participateLotterySwitch)
        XCTAssertNotNil(viewController.bonusValueLabel)
        XCTAssertNotNil(viewController.receiveCouponLabel)
    }
    
}
