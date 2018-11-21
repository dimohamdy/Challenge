//
//  DroidListRouter.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import Foundation

class DroidListRouter {
    weak var viewController: DroidListViewController?

    func navigateToDroidControl(droid:Droid) {
        let controlDroidViewController:ControlDroidViewController = ControlDroidBuilder.viewController(droid: droid)
        
        viewController?.navigationController?.pushViewController(controlDroidViewController, animated: true)
    }
}
