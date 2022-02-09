//
//  最长公共前缀.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/8.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnmav1/
import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else {
        return ""
    }
    if let firstStr = strs.first, strs.count == 1 {
        return firstStr
    }
    
    let mid = strs.count / 2
    
    let prefixStr = longestCommonPrefix(Array(strs[0 ..< mid]))
    let suffixStr = longestCommonPrefix(Array(strs[mid ..< strs.count]))
    
    return longestCommonPrefix(prefixStr, suffixStr)
}

func longestCommonPrefix(_ leftStr: String, _ rightStr: String) -> String {
    if leftStr.isEmpty || rightStr.isEmpty {
        return ""
    }
    
    let minCount = min(leftStr.count, rightStr.count)
    var i = 0
    var prefix = ""
    while i < minCount {
        let leftChar = leftStr[leftStr.index(leftStr.startIndex, offsetBy: i)]
        let rightChar = rightStr[rightStr.index(rightStr.startIndex, offsetBy: i)]
        if leftChar != rightChar {
            break
        }
        
        prefix += String(leftChar)
        i += 1
    }
    return prefix
}

/// 动态规划，找两个字符串最长公共子串
func longestCommonString(_ leftStr: String, _ rightStr: String) -> String {
    guard !leftStr.isEmpty && !rightStr.isEmpty else {
        return ""
    }
    
    let leftCount = leftStr.count
    let rightCount = rightStr.count
    var dp: [[String]] = .init(repeating:
                                    .init(repeating: "", count: rightCount + 1),
                               count: leftCount + 1
    )
    
    for i in 1 ... leftCount {
        for j in 1 ... rightCount {
            let leftChar = leftStr[leftStr.index(leftStr.startIndex, offsetBy: i - 1)]
            let rightChar = rightStr[rightStr.index(rightStr.startIndex, offsetBy: j - 1)]
            
            if leftChar == rightChar {
                var str = dp[i - 1][j - 1]
                str += String(leftChar)
                dp[i][j] = str
            }
            else {
                let a = dp[i - 1][j]
                let b = dp[i][j - 1]
                let str = a.count < b.count ? a : b
                dp[i][j] = str
            }
        }
    }
    
    let commonPrefix = dp[leftCount][rightCount]
    return commonPrefix
}
