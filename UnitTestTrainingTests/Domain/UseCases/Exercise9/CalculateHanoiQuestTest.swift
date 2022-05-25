//
//  CalculateHanoiQuestTest.swift
//  UnitTestTrainingTests
//
//  Created by truong.quoc.bao on 25/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class CalculateHanoiQuestTest: XCTestCase, CalculatingHanoiQuestResult {
    
    override func setUp() {
        super.setUp()
    }
    
    /// Test case 1
    /// - bringMagicWand: true
    /// - bringStrategist: true
    /// - bringDarknessKey: true
    /// - bringLightSword: true
    func test_bringMagicWand_bringStrategist_bringDarknessKey_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .beatBigBoss)
    }
    
    /// Test case 2
    /// - bringMagicWand: true
    /// - bringStrategist: true
    /// - bringDarknessKey: true
    /// - bringLightSword: false
    func test_bringMagicWand_bringStrategist_bringDarknessKey() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomOpened)
    }
    
    /// Test case 3
    /// - bringMagicWand: true
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: optional
    func test_bringMagicWand_bringStrategist_bringOrNoLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 4
    /// - bringMagicWand: true
    /// - bringStrategist: false
    /// - bringDarknessKey: true
    /// - bringLightSword: true
    func test_bringMagicWand_bringDarknessKey_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .beatBigBoss)
    }
    
    /// Test case 5
    /// - bringMagicWand: true
    /// - bringStrategist: false
    /// - bringDarknessKey: true
    /// - bringLightSword: false
    func test_bringMagicWand_bringDarknessKey() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomOpened)
    }
    
    /// Test case 6
    /// - bringMagicWand: true
    /// - bringStrategist: false
    /// - bringDarknessKey: false
    /// - bringLightSword: optional
    func test_bringMagicWand_bringOrNoLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 7
    /// - bringMagicWand: false
    /// - bringStrategist: true
    /// - bringDarknessKey: true
    /// - bringLightSword: true
    func test_bringStrategist_bringDarknessKey_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .beatBigBoss)
    }
    
    /// Test case 8
    /// - bringMagicWand: false
    /// - bringStrategist: true
    /// - bringDarknessKey: true
    /// - bringLightSword: false
    func test_bringStrategist_bringDarknessKey() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomOpened)
    }
    
    /// Test case 9
    /// - bringMagicWand: false
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: optional
    func test_bringStrategist_bringOrNoLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 10
    /// - bringMagicWand: false
    /// - bringStrategist: false
    /// - bringDarknessKey: optional
    /// - bringLightSword: optional
    func test_bringOrNoDarknessKey_bringOrNoLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomNotFound)
    }
    
    /// Test case 11
    /// - bringMagicWand: true
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: true
    func test_bringMagicWand_bringStrategist_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 12
    /// - bringMagicWand: true
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: false
    func test_bringMagicWand_bringStrategist() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 13
    /// - bringMagicWand: true
    /// - bringStrategist: false
    /// - bringDarknessKey: false
    /// - bringLightSword: true
    func test_bringMagicWand_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 14
    /// - bringMagicWand: true
    /// - bringStrategist: false
    /// - bringDarknessKey: false
    /// - bringLightSword: false
    func test_bringMagicWand() {
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: false,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 15
    /// - bringMagicWand: false
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: true
    func test_bringStrategist_bringLightSword() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
    /// Test case 16
    /// - bringMagicWand: false
    /// - bringStrategist: true
    /// - bringDarknessKey: false
    /// - bringLightSword: false
    func test_bringStrategist() {
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: false
        )
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(result, .roomFound)
    }
    
}
