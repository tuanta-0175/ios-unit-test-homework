//
//  Exercise6ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class Exercise6ViewControllerTests: XCTestCase {
    
    private var viewController: Exercise6ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise6ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.moneySpentTextField)
        XCTAssertNotNil(viewController.errorMessageLabel)
        XCTAssertNotNil(viewController.freeMinutesLabel)
        XCTAssertNotNil(viewController.watchMovieSwitch)
    }
    
}
