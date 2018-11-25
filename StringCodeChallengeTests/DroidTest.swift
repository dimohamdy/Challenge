//
//  DroidTest.swift
//  StringCodeChallengeTests
//
//  Created by BinaryBoy on 11/24/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import StringCodeChallenge

class DroidTest: XCTestCase {

    var droid:Droid!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let sector =  Sector(x: 5, y: 5)
        droid = Droid(index: 0, curretSector: sector)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMoveForward(){
      let newSector =   droid.moveForward()
      XCTAssertEqual(droid.curretSector.x, newSector.x) //no change in x
      XCTAssertEqual(newSector.y,droid.curretSector.y - 1) //no change in x
    }
    
    func testMoveBack(){
        let newSector =   droid.moveBack()
        XCTAssertEqual(droid.curretSector.x, newSector.x) //no change in x
        XCTAssertEqual(newSector.y,droid.curretSector.y + 1) // change in y
    }
    
    
    func testMoveLeft(){
        let newSector =   droid.moveLeft()
        XCTAssertEqual(droid.curretSector.y, newSector.y) //no change in y
        XCTAssertEqual(newSector.x,droid.curretSector.x - 1) //change in x
        
    }
    
    func testMoveRight(){
        let newSector =   droid.moveRight()
        XCTAssertEqual(droid.curretSector.y, newSector.y) //no change in x
        XCTAssertEqual(newSector.x,droid.curretSector.x + 1) //change in x
        
    }
    

    func testNearestDroid(){
        let curretDroid:Droid = Droid(index: 0, curretSector: Sector(x: 5, y: 5))
        
        
        let droid1:Droid = Droid(index: 1, curretSector: Sector(x: 1, y: 1))
        let droid2:Droid = Droid(index: 2, curretSector: Sector(x: 2, y: 2))
        let droid3:Droid = Droid(index: 3, curretSector: Sector(x: 3, y: 3)) //nearest one
        let droid9:Droid = Droid(index: 4, curretSector: Sector(x: 9, y: 9))

        var droidList:[Droid] = [Droid]()
        droidList.append(contentsOf: [droid1,droid2,droid3,droid9])
        
        let nearestDroid = curretDroid.getNeaestDroid(droidList:droidList)
        
        XCTAssertEqual(nearestDroid.curretSector.x,3)
        XCTAssertEqual(nearestDroid.curretSector.y,3)

    }
}
