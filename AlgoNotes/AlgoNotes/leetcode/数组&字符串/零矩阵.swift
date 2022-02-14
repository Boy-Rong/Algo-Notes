//
//  零矩阵.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/13.
//

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    let m = matrix.count
    let n = matrix.first?.count ?? 0
    
    guard m == 0 || n == 0 else {
        return
    }
    
    var mSet: [Bool] = .init(repeating: false, count: m)
    var nSet: [Bool] = .init(repeating: false, count: n)
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if matrix[i][j] == 0 {
                mSet[i] = true
                nSet[j] = true
            }
        }
    }
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if mSet[i] || nSet[j] {
                matrix[i][j] = 0
            }
        }
    }
    
}
