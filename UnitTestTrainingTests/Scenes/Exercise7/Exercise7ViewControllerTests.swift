//
//  Exercise7ViewControllerTests.swift
//  DALi
//
//  Created by bui.van.hung on 5/10/21.
//  Copyright © 2021 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import Reusable
import UIKit
import XCTest

final class Exercise7ViewControllerTests: XCTestCase {
    var viewController: Exercise7ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise7ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.cartAmountTextField)
        XCTAssertNotNil(viewController.errorLabel)
        XCTAssertNotNil(viewController.totalFeeLabel)
        XCTAssertNotNil(viewController.standardFeeLabel)
        XCTAssertNotNil(viewController.quickTransportFeeLabel)
        XCTAssertNotNil(viewController.membershipSwitch)
        XCTAssertNotNil(viewController.quickDeliverSwitch)
    }
}
