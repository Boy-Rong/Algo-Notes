//
//  最长公共子序列.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/3.
//

import Foundation

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    if text1.isEmpty || text2.isEmpty {
        return 0
    }
    
    let mCount = text1.count
    let nCount = text2.count
    var dp: [[Int]] = .init(
        repeating: .init(repeating: 0, count: nCount + 1),
        count: mCount + 1
    )
    let text1Array = Array(text1)
    let text2Array = Array(text2)
    
    for m in 1 ... mCount {
        for n in 1 ... nCount {
            if text1Array[m - 1] == text2Array[n - 1] {
                dp[m][n] = dp[m - 1][n - 1] + 1
            }
            else {
                dp[m][n] = max(dp[m - 1][n], dp[m][n - 1])
            }
        }
    }
    
    return dp[mCount][nCount]
}
