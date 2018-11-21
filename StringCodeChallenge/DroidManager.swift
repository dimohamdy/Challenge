//
//  DroidManager.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

struct Sector {
    var x:Int
    var y:Int
}


class DroidManager {
    
    static func getCurrentlyDispatchedDroids(completioan:(_ droidsNumber:[Droid]) -> Void) {
        let droids:[Droid] = [Droid]()
        completioan(droids)
    }
    
    
    static func moveToSector(sector:Sector){
        
        sleep(3)
    }
}

