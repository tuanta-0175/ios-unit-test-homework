//
//  Exercise9ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

class Exercise9ViewControllerTests: XCTestCase {
    
    private var viewController: Exercise9ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise9ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.magicWandSelectionSwitch)
        XCTAssertNotNil(viewController.strategistSelectionSwitch)
        XCTAssertNotNil(viewController.darknessKeySelectionSwitch)
        XCTAssertNotNil(viewController.lightSwordSelectionSwitch)
        XCTAssertNotNil(viewController.hitBigBossButton)
        XCTAssertNotNil(viewController.resultLabel)
    }
    
}
