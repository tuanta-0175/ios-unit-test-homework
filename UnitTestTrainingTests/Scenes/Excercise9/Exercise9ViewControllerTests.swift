//
//  Exercise9ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class Exercise9ViewControllerTests: XCTestCase {
    var viewController: Exercise9ViewController!
    
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
