//
//  Exercise1ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 19/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise1ViewControllerTests: XCTestCase {
    var viewController: Exercise1ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise1ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.voucherSwitch)
        XCTAssertNotNil(viewController.purchaseDatePicker)
        XCTAssertNotNil(viewController.priceLabel)
    }
}
