//
//  对角线遍历.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/13.
//

import Foundation

func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    let m = mat.count
    let n = mat.first?.count ?? 0
    guard m != 0 && n != 0 else {
        return []
    }
        
    var row = 0
    var list: [Int] = []
    
    var mIndex = 0
    var nIndex = 0
    
    while row < m + n {
        // 向上
        mIndex = row < m ? row : m - 1
        nIndex = row < m ? 0 : row - mIndex
        while mIndex >= 0 && nIndex < n {
            list.append(mat[mIndex][nIndex])
            
            mIndex -= 1
            nIndex += 1
        }
        row += 1
        
        // 向下
        nIndex = row < n ? row : n - 1
        mIndex = row < n ? 0 : row - nIndex
        while nIndex >= 0 && mIndex < m {
            list.append(mat[mIndex][nIndex])
            
            mIndex += 1
            nIndex -= 1
        }
        row += 1
    }
    
    return list
}
