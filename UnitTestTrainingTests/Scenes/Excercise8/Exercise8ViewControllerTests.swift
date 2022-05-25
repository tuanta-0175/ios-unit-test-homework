//
//  Exercise8ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise8ViewControllerTests: XCTestCase {
    var viewController: Exercise8ViewController!

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

