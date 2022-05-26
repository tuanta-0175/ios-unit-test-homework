//
//  CalculatingHanoiQuestResultTest.swift
//  UnitTestTrainingTests
//
//  Created by Ngô Minh Tuấn on 26/05/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculatingHanoiQuestResultTest: XCTestCase, CalculatingHanoiQuestResult {
    
    // case 1:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: N
    func test_case1() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: false, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomNotFound)
    }
    
    // case 2:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: Y
    func test_case2() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: false, bringDarknessKey: false, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomNotFound)
    }
    
    // case 3:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: N
    func test_case3() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: false, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomNotFound)
    }
    
    // case 4:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: Y
    func test_case4() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: false, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomNotFound)
    }
    
    // case 5:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: N
    func test_case5() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 6:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: Y
    func test_case6() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: false, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 7:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: N
    func test_case7() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomOpened)
    }
    
    // case 8:
    // Có đũa phép thuật: N
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: Y
    func test_case8() {
        let dto = HanoiQuestDto(bringMagicWand: false, bringStrategist: true, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .beatBigBoss)
    }
    
    // case 9:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: N
    func test_case9() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 10:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: Y
    func test_case10() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: false, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 11:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: N
    func test_case11() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomOpened)
    }
    
    // case 12:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: N
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: Y
    func test_case12() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: false, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .beatBigBoss)
    }
    
    // case 13:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: N
    func test_case13() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: false, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 14:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: N
    // Có kiếm ánh sáng: Y
    func test_case14() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: false, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomFound)
    }
    
    // case 15:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: N
    func test_case15() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: true, bringLightSword: false)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .roomOpened)
    }
    
    // case 16:
    // Có đũa phép thuật: Y
    // Có quân sư đồng hành: Y
    // Có chìa khóa bóng đêm: Y
    // Có kiếm ánh sáng: Y
    func test_case16() {
        let dto = HanoiQuestDto(bringMagicWand: true, bringStrategist: true, bringDarknessKey: true, bringLightSword: true)
        let result = self.calculateHanoiQuestResult(dto: dto)
        
        XCTAssertEqual(result, .beatBigBoss)
    }
}
