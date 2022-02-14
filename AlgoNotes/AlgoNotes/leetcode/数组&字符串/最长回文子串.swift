//
//  最长回文子串.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

// https://leetcode-cn.com/leetbook/read/array-and-string/conm7/

import Foundation

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    let count = s.count
    var dp: [[Bool]] = .init(
        repeating: .init(repeating: false, count: count),
        count: count
    )
    
    for i in 0 ..< count {
        dp[i][i] = true
    }
    
    var maxCount = 1
    var maxStart = 0
    
    for l in 2 ... count {
        for start in 0 ..< count {
            let end = start + l - 1
            guard end < count else {
                break
            }
            let startIndex = s.index(s.startIndex, offsetBy: start)
            let endIndex = s.index(s.startIndex, offsetBy: end)
            
            // 是回文串
            if s[startIndex] == s[endIndex] && (l == 2 || dp[start + 1][end - 1]) {
                dp[start][end] = true
                if l > maxCount {
                    maxCount = l
                    maxStart = start
                }
            }
        }
    }
    
    let startIndex = s.index(s.startIndex, offsetBy: maxStart)
    let endIndex = s.index(s.startIndex, offsetBy: maxStart + maxCount - 1)
    return String(s[startIndex ... endIndex])
}
