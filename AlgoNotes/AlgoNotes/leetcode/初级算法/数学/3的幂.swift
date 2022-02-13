//
//  3的幂.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnsdi2/
import Foundation

func isPowerOfThree(_ n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    var value = n
    while value > 1 {
        if value % 3 != 0 {
            return false
        }
        value = value / 3
    }
    return true
}
