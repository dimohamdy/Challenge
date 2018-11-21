//
//  Droid.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/19/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

struct Droid {
    var curretSector:Sector
    var currentState:State = .none
    var index:Int
    
    
    
    mutating func move(newSector:Sector,completioan:(_ state:State) -> Void) {
        
        completioan(.reciveCommand)
        
        switch  self.currentState {
        case .stillMove :
            completioan(.stillMove)
        default:
            break
        }
        curretSector = newSector

        //begin move
        
        
        
        //arrive and check the the state of R2_D2
        completioan(.stateOfR2D2(found: true))


    }
    
    func getStateOfR2ForCurretSector()->State{
        return currentState
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
