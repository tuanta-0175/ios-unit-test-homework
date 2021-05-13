//
//  Exercise8ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by dong son on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
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
