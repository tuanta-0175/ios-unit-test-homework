//
//  Exercise10ViewControllerTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise10ViewControllerTest: XCTestCase {
    var viewController: Exercise10ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise10ViewController.instantiate()
    }
    
    func test_ibOutlet() {
        _ = viewController.view
        
        XCTAssertNotNil(viewController.participateLotteryView)
        XCTAssertNotNil(viewController.memberRankSegment)
        XCTAssertNotNil(viewController.prepaidCardTypeSegment)
        XCTAssertNotNil(viewController.participateLotterySwitch)
        XCTAssertNotNil(viewController.bonusValueLabel)
        XCTAssertNotNil(viewController.receiveCouponLabel)
    }
}
