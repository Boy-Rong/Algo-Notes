//
//  反转字符串.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnhbqj/
func reverseString(_ s: inout [Character]) {
    guard s.count > 1 else {
        return
    }
    
    var begin = 0
    var end = s.count - 1
    
    while begin < end {
        (s[begin], s[end]) = (s[end], s[begin])
        begin += 1
        end -= 1
    }
}
