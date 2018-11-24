//
//   Simulator.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    init(rows: Int, columns: Int,defaultValue: T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultValue, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

final class SimulatorManager {
    private let numberOfDroid:Int = 10
    
    var droids:[Droid] = [Droid]()
    
    private let gridSize = 1000

    private var step:Int {
        return gridSize / numberOfDroid
    }
    private var random:Int{
        return Int.random(in: 0 ..< gridSize)
    }
    var matrix:Matrix<Bool>!
    
    static let shared = SimulatorManager()
    init() {
        
        for index in  0...numberOfDroid {
            
            let curretSector = Sector(x:0,y: index * (step - 1))

            let droid = Droid(index:index, curretSector:curretSector, currentState:.none)
            droids.append(droid)

        }
        
        
        //create the matrixz
         matrix = Matrix(rows: gridSize, columns: gridSize,defaultValue:false)

        //add the R2-D2 in random sector
        matrix[random,random] = true
    }
}
