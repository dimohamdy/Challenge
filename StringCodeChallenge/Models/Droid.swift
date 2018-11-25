//
//  Droid.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/19/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

class Droid {
    var index:Int = 0
    var curretSector:Sector
    var currentState:State = .none
    init(index:Int,curretSector:Sector,currentState:State = .none) {
        self.index = index
        self.curretSector = curretSector
        self.currentState = currentState

    }
     func move(newSector:Sector,completioan:(_ state:State) -> Void) {
        //simulate delay with sleep funtion
        sleep(1)
        currentState = .reciveCommand
        completioan(.reciveCommand)
        
        switch  self.currentState {
        case .stillMove :
            currentState = .stillMove
            completioan(.stillMove)
        default:
            break
        }
        curretSector = newSector

        //begin move
        
        //arrive and check the the state of R2_D2
        sleep(1)
       let foundOfR2D2 =   SimulatorManager.shared.matrix[newSector.x,newSector.y]
        currentState = .stateOfR2D2(found: foundOfR2D2)
       completioan(.stateOfR2D2(found: foundOfR2D2))

    }
    
    func getStateOfR2ForCurretSector()->State{
        return currentState
    }
    
    
    func moveForward() -> Sector {
        let y = self.curretSector.y - 1
        if SimulatorManager.shared.matrix.indexIsValid(row: self.curretSector.x, column: y) {
            return Sector(x: self.curretSector.x,y: y)
        }
        return curretSector

    }
    func moveBack()  -> Sector  {
        let y = self.curretSector.y + 1
        if SimulatorManager.shared.matrix.indexIsValid(row:self.curretSector.x, column: y) {
            return Sector(x: self.curretSector.x,y: y)
        }
        return curretSector

    }
    
    func moveLeft()  -> Sector  {
        let x = self.curretSector.x - 1
        if SimulatorManager.shared.matrix.indexIsValid(row:x, column: self.curretSector.y) {
        return Sector(x:x,y:  self.curretSector.y)
        }
        return curretSector

    }
    func moveRight()  -> Sector  {
        let x = self.curretSector.x + 1
        if SimulatorManager.shared.matrix.indexIsValid(row:x, column: self.curretSector.y) {

        return Sector(x:x,y:  self.curretSector.y)
        }
        return curretSector
    }
    private func cost(droid:Droid) -> Int{
        let x = abs(droid.curretSector.x - self.curretSector.x)
        let y = abs(droid.curretSector.y - self.curretSector.y)
        
        return  x + y
    }
    
    func getNeaestDroid(droidList:[Droid]) -> Droid{
        

        let droids:[Droid] = droidList
        
        var tempDroid:Droid = self
        var tempCost = Int.max
        
        for droid in droids {
            //get the between the current droid and other droid
         
            
            if droid.index == self.index {
                continue
            }
            
            let costValue = cost(droid: droid)

            if  costValue < tempCost {
                tempDroid = droid
                tempCost = costValue
            }
            
        }
        print("\(tempDroid.index)")

        return tempDroid
    }
}



enum State {
    case none
    case reciveCommand
    case stillMove
    case stateOfR2D2(found:Bool)
    
    var localizedDescription: String? {
        switch self {
        case .reciveCommand:
            return "ack"
        case .stillMove:
            return "currently mobile"
        case .stateOfR2D2(let found):
            return "state of R2_D2 \(found)"
        default:
            return nil
        }
    }
}
