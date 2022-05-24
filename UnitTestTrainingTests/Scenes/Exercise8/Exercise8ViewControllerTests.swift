//
//  Exercise8ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 24/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise8ViewControllerTests: XCTestCase {
    
    private var viewController: Exercise8ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise8ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.ageTextField)
        XCTAssertNotNil(viewController.errorMessageLabel)
        XCTAssertNotNil(viewController.genderSwitch)
        XCTAssertNotNil(viewController.datePicker)
        XCTAssertNotNil(viewController.feeLabel)
        XCTAssertNotNil(viewController.genderLabel)
    }
    
}
