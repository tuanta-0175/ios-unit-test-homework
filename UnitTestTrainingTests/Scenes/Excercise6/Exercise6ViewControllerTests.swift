//
//  Exercise6ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 23/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise6ViewControllerTests: XCTestCase {
    var viewController: Exercise6ViewController!

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
