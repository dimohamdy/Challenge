//
//  ControlDroidViewController.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ControlDroidViewController: UITableViewController {
    var viewModel: ControlDroidViewModel
    var router: ControlDroidRouter
    fileprivate let disposeBag = DisposeBag()

    @IBOutlet weak var droidNameLabel: UILabel!
    @IBOutlet weak var currentSectorLabel: UILabel!
    @IBOutlet weak var droidStateLabel: UILabel!
    
    
    @IBOutlet weak var xOfSectorTF: UITextField!
    @IBOutlet weak var yOfSectorTF: UITextField!

//    init(withViewModel viewModel: ControlDroidViewModel, router: ControlDroidRouter) {
//        self.viewModel = viewModel
//        self.router = router
//        super.init(nibName: nil, bundle: nil)
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
        setupRx()
    }
    
    
    
    @IBAction func moveForward(_ sender: UIButton) {
    }
    @IBAction func moveLeft(_ sender: UIButton) {
    }
    @IBAction func moveRight(_ sender: UIButton) {
    }
    @IBAction func moveBack(_ sender: UIButton) {
    }
    @IBAction func moveToSector(_ sender: UIButton) {
    }
}

// MARK: Setup
private extension ControlDroidViewController {

    func setupViews() {
        
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
}
