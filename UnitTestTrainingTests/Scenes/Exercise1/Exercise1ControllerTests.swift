//
//  Exercise1ControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class Exercise1ControllerTests: XCTestCase {
    
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
