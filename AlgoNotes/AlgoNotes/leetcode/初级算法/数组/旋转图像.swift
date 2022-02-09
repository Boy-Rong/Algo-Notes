//
//  旋转图像.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/5.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    let count = matrix.count
    // 上下翻转
    var begin = 0
    var end = count - 1
    
    while begin < end {
        for i in 0 ..< count {
            (matrix[begin][i], matrix[end][i]) = (matrix[end][i], matrix[begin][i])
        }
        begin += 1
        end -= 1
    }
    
    //对角线翻转
    for i in 0 ..< count {
        for j in (i + 1) ..< count {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}
