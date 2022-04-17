//
//   搜索二维矩阵 II.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/22.
//

// https://leetcode-cn.com/problems/search-a-2d-matrix-ii/
import Foundation


func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    let n = matrix.first?.count ?? 0
    var i = 0
    var j = n - 1
    
    while j >= 0 && i < m {
        let value = matrix[i][j]
        if value == target {
            return true
        }
        
        if value > target {
            j -= 1
        }
        else {
            i += 1
        }
    }
    
    return false
}
