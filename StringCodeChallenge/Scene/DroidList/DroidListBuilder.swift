//
//  DroidListBuilder.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct DroidListBuilder {

    static func viewController() -> DroidListViewController {
        let viewModel = DroidListViewModel()
        let router = DroidListRouter()
        let viewController: DroidListViewController = DroidListViewController.instantiateFromStoryboard(.Main)
        router.viewController = viewController

        viewController.router = router
        viewController.viewModel = viewModel

        return viewController
    }
}
