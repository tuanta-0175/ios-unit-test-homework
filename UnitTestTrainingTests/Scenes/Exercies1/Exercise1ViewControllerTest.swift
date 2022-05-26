//
//  Exercise1ViewControllerTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise1ViewControllerTest: XCTestCase {
    var viewController: Exercise1ViewController!
    override func setUp() {
        super.setUp()
        viewController = Exercise1ViewController.instantiate()
    }
    
    func test_ibOutlet() {
        _ = viewController.view
        XCTAssertNotNil(viewController.voucherSwitch)
        XCTAssertNotNil(viewController.priceLabel)
        XCTAssertNotNil(viewController.purchaseDatePicker)
    }
}
