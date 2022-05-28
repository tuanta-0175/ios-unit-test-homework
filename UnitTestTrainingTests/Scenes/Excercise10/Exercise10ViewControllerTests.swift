//
//  Exercise10ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 28/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class Exercise10ViewControllerTests: XCTestCase {
    var viewController: Exercise10ViewController!
    
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
