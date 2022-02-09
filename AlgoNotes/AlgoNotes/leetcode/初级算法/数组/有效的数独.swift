//
//  有效的数独.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/5.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    let count = board.count
    
    var lines: [[Int]] = .init(
        repeating: .init(repeating: 0, count: count),
        count: count
    )
    var columns: [[Int]] = .init(
        repeating: .init(repeating: 0, count: count),
        count: count
    )
    var boxs: [[Int]] = .init(
        repeating: .init(repeating: 0, count: count),
        count: count
    )

    for i in 0 ..< count {
        for j in 0 ..< count {
            let value = board[i][j]
            guard value != ".", let intValue = Int(String(value)) else {
                continue
            }
            
            // 数独中数字为 [1,9]，数组索引为 [0, 8]
            let number = intValue - 1
            
            let k = i / 3 * 3 + j / 3
            if lines[i][number] != 0 ||
                columns[j][number] != 0 ||
                boxs[k][number] != 0 {
                return false
            }
            else {
                lines[i][number] = 1
                columns[j][number] = 1
                boxs[k][number] = 1
            }
        }
    }

    return true
}
