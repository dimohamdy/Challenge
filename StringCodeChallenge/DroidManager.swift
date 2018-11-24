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
    let simulatorManager:SimulatorManager!
    init(simulatorManager:SimulatorManager) {
        self.simulatorManager = simulatorManager
    }
    func getCurrentlyDispatchedDroids(completioan:(_ droidsNumber:[Droid]) -> Void) {
        let droids:[Droid] = simulatorManager.droids
        
        completioan(droids)
    }

}

