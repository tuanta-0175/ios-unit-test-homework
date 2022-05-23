//
//  Exercise4ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise4ViewControllerTests: XCTestCase {
    
    var viewController: Exercise4ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise4ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.dateBackgroundView)
        XCTAssertNotNil(viewController.dateLabel)
        XCTAssertNotNil(viewController.datePicker)
    }
    
}
