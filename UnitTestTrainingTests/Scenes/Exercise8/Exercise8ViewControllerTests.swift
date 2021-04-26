//
//  Exercise8ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by khuat.tien.thanh on 19/04/2021.
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
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.ageTextField)
        XCTAssertNotNil(viewController.errorMessageLabel)
        XCTAssertNotNil(viewController.genderSwitch)
        XCTAssertNotNil(viewController.datePicker)
        XCTAssertNotNil(viewController.feeLabel)
        XCTAssertNotNil(viewController.genderLabel)
    }
}
