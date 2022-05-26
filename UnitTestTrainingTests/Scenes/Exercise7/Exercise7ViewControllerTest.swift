//
//  Exercise7ViewControllerTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise7ViewControllerTest: XCTestCase {
    
    var viewController: Exercise7ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise7ViewController.instantiate()
    }
    
    func test_ibOutlet() {
        _ = viewController.view
        XCTAssertNotNil(viewController.cartAmountTextField)
        XCTAssertNotNil(viewController.errorLabel)
        XCTAssertNotNil(viewController.totalFeeLabel)
        XCTAssertNotNil(viewController.standardFeeLabel)
        XCTAssertNotNil(viewController.quickTransportFeeLabel)
        XCTAssertNotNil(viewController.membershipSwitch)
        XCTAssertNotNil(viewController.quickDeliverSwitch)
    }
}
