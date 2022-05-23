//
//  Exercise4ViewControllerTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 18/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise4ViewContrllerTest: XCTestCase {
    
    var viewController: Exercise4ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise4ViewController.instantiate()
    }
    
    func test_ibOutlet() {
        _ = viewController.view
        XCTAssertNotNil(viewController.dateLabel)
        XCTAssertNotNil(viewController.datePicker)
        XCTAssertNotNil(viewController.dateBackgroundView)
    }
}
