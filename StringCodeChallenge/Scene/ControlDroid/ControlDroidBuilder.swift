//
//  ControlDroidBuilder.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct ControlDroidBuilder {

    
    static func viewController(droid:Droid) -> ControlDroidViewController {
        let router = ControlDroidRouter()
        let viewController: ControlDroidViewController = ControlDroidViewController.instantiateFromStoryboard(.Main)

        router.viewController = viewController
        viewController.viewModel = ControlDroidViewModel(droid: droid)
        viewController.router = router
        return viewController
    }
    

}
