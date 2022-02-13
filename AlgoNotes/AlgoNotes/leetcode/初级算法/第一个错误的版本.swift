//
//  第一个错误的版本.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/10.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnto1s/

import Foundation

func firstBadVersion(_ n: Int) -> Int {
    searchVersion(begin: 1, end: n)
}

func searchVersion(begin: Int, end: Int) -> Int {
    guard end - begin > 0 else {
        return begin
    }
    let mid = (begin + end) / 2
    let isBad = isBadVersion(mid)
    
    if !isBad && isBadVersion(mid + 1) {
        return mid + 1
    }
    
    if isBad {
        return searchVersion(begin: begin, end: mid)
    }
    else {
        return searchVersion(begin: mid + 1, end: end)
    }

}

func isBadVersion(_ version: Int) -> Bool {
    return true
}
