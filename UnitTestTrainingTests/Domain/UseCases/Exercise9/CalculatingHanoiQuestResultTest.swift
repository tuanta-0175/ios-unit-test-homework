//
//  CalculatingHanoiQuestResultTest.swift
//  UnitTestTrainingTests
//
//  Created by tran.quang.vu on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculatingHanoiQuestResultTest: XCTestCase, CalculatingHanoiQuestResult {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_isStrategist_isWand_isKey_isSword() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.beatBigBoss, result)
    }
    
    func test_isStrategist_isWand_isKey_noSword() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomOpened, result)
    }
    
    func test_isStrategist_isWand_noKey() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomFound, result)
    }
    
    func test_noStrategist_isWand_isKey_isSword() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.beatBigBoss, result)
    }
    
    func test_noStrategist_isWand_isKey_noSword() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomOpened, result)
    }
    
    func test_noStrategist_isWand_noKey() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomFound, result)
    }
    
    func test_isStrategist_noWand_isKey_isSword() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.beatBigBoss, result)
    }
    
    func test_isStrategist_noWand_isKey_noSword() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomOpened, result)
    }
    
    func test_isStrategist_noWand_noKey() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(HanoiQuestResult.roomFound, result)
    }
    
    func test_noStrategist_noWand() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: false, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        XCTAssertEqual(HanoiQuestResult.roomNotFound, result)
    }
}
