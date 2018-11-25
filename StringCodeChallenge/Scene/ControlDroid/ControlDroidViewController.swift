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
    var viewModel: ControlDroidViewModel!
    var router: ControlDroidRouter!
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var droidNameLabel: UILabel!
    @IBOutlet weak var currentSectorLabel: UILabel!
    @IBOutlet weak var droidStateLabel: UILabel!
    
    
    @IBOutlet weak var xOfSectorTF: UITextField!
    @IBOutlet weak var yOfSectorTF: UITextField!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    @IBAction func moveForward(_ sender: UIButton) {
        viewModel.move(direction: .forward)
    }
    @IBAction func moveLeft(_ sender: UIButton) {
        viewModel.move(direction: .left)
    }
    @IBAction func moveRight(_ sender: UIButton) {
        viewModel.move(direction: .right)
    }
    @IBAction func moveBack(_ sender: UIButton) {
        viewModel.move(direction: .back)
    }
    @IBAction func moveToSector(_ sender: UIButton) {
        viewModel.move()
    }
    
    func bindViewModel() {
        
        
        bind(label: droidNameLabel, to: viewModel.droidNameObservable)
        bind(label: droidStateLabel, to: viewModel.stateObservable)
        
        bind(label: currentSectorLabel, to: viewModel.currentSectorObservable)

        bind(label: droidNameLabel, to: viewModel.droidNameObservable)

        bind(textField: xOfSectorTF, to: viewModel.xSectorInput)
        bind(textField: yOfSectorTF, to: viewModel.ySectorInput)
        
        viewModel.foundR2D2Observable.filter { found -> Bool in
            found == true
            }.subscribe(onNext: { [weak self] _ in
                //show

                self?.askUserToPickupDroid()
            }).disposed(by: disposeBag)
    }
    private func askUserToPickupDroid(){
        
        let alert = UIAlertController(title: "Pick Droid", message: "R2D2 is found in sector (\(SimulatorManager.shared.R2D2Sector.x),\(SimulatorManager.shared.R2D2Sector.y) are you need to validate i will pickup nearest droid to validate exitsing of R2D2).", preferredStyle: .alert)
        
        let okAction =  UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            
            guard let droid = self?.viewModel.getValidatorDroid(),let sector = self?.viewModel.droid.curretSector else {
                return
            }
            
            self?.viewModel = ControlDroidViewModel(droid: droid)
            self?.bindViewModel()
            self?.viewModel.move(to: sector)
            
        })
        
        let noAction =  UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true)
        
        
    }
    private func bind(label: UILabel, to observable: Observable<String?>) {
        observable
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
    
    
    private func bind(textField: UITextField, to variable: Variable<String?>) {
        variable.asObservable().bind(to: textField.rx.text)
            .disposed(by: disposeBag)
        
        textField.rx.text.bind(to: variable).disposed(by: disposeBag)
    }
}
