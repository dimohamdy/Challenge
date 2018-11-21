//
//  DroidListViewModel.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import RxSwift

enum DroidTableViewCellType {
    case droid(cellViewModel: Droid)
    case error(message: String)
    case empty
}

class DroidListViewModel {
    
    // input
    var droisObservable: Observable<[DroidTableViewCellType]> {
        return droidList.asObservable()
    }
    
    private let droidList = Variable<[DroidTableViewCellType]>([])
    
    // output
    // internal
    
    init() {
        setupRx()
    }
    
    
}

// MARK: Setup
private extension DroidListViewModel {
    
    func setupRx() {

        DroidManager.getCurrentlyDispatchedDroids { [weak self] droids in
            
            guard droids.count > 0 else {
                self?.droidList.value = [.empty]
                return
            }
            
            
            var array:[DroidTableViewCellType] = [DroidTableViewCellType]()
            
            
            for droid in droids {
                
                    array.append(.droid(cellViewModel: droid))
                }
            self?.droidList.value = array

            }
        
            
        }
    }
