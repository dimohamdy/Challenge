//
//  DroidListBuilder.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct DroidListBuilder {

    private static func viewController(droidManger:DroidManager) -> DroidListViewController {
        let viewModel = DroidListViewModel(droidManager: droidManger)
        let router = DroidListRouter()
        let viewController: DroidListViewController = DroidListViewController.instantiateFromStoryboard(.Main)
        router.viewController = viewController

        viewController.router = router
        viewController.viewModel = viewModel

        return viewController
    }
    
    
    static func navigationController(droidManger:DroidManager) -> UINavigationController {
        
        return UINavigationController(rootViewController: DroidListBuilder.viewController(droidManger: droidManger))
    }
}
