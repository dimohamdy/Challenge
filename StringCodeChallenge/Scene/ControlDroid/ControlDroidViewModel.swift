//
//  ControlDroidViewModel.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import RxSwift

class ControlDroidViewModel:BaseViewModel {

    let submitMoveButtonEnabled = PublishSubject<Void>()
    
    private var droidName = Variable<String?>("")
    private var xSector = Variable<String?>("")
    private var ySector = Variable<String?>("")
    private var currentState = Variable<String?>("")

    
    
     var xSectorInput = Variable<String?>("")
     var ySectorInput = Variable<String?>("")
    
    var droidNameObservable: Observable<String?> {
        return droidName.asObservable()
    }
    
    var currentSectorObservable: Observable<String?> {
        return  Observable.combineLatest(xSectorObservable, ySectorObservable) {
            
            guard let x = $0,let y = $1 else {
                return ""
            }
            return "\(String(describing: x)),\(String(describing: y))"
        }

    }
    
    var xSectorObservable: Observable<String?> {
        return xSector.asObservable()
    }
    var ySectorObservable: Observable<String?> {
        return ySector.asObservable()
    }
    var stateObservable: Observable<String?> {
        return currentState.asObservable()
    }
    
    
    var droid: Droid!
    init(droid: Droid) {
        super.init()
        self.droid = droid
        self.droidName.value = "Droid \(droid.index)"
        self.xSector.value = "\(droid.curretSector.x)"
        self.ySector.value = "\(droid.curretSector.y)"
        self.currentState.value = droid.currentState.localizedDescription
        
        self.submitMoveButtonEnabled.asObserver().subscribe(onNext: { [weak self] in
            let sector = Sector(x: droid.curretSector.x,y: droid.curretSector.y)
            self?.move(to: sector)
        }).disposed(by: self.disposeBag)
    }
    
    private func move(to sector:Sector){
        droid.move(newSector: sector) { [weak self] state in
            self?.currentState.value = state.localizedDescription ?? ""
            self?.xSector.value = "\(droid.curretSector.x)"
            self?.ySector.value = "\(droid.curretSector.y)"
        }
    }
    
     func move(){
        guard let x = Int(self.xSectorInput.value ?? ""),let y = Int(self.ySectorInput.value ?? "") else {
            return
        }
        let sector = Sector(x: x,y: y)
        move(to: sector)
    }

    func move(direction:Direction){
        let sector:Sector!
        switch direction {
        case .forward:
             sector = droid.moveForward()
        case .left:
             sector = droid.moveLeft()
        case .right:
             sector = droid.moveRight()
        case .back:
             sector = droid.moveBack()
        }
        move(to: sector)
    }

}
enum Direction : String{
    case forward
    case left
    case right
    case back
}
