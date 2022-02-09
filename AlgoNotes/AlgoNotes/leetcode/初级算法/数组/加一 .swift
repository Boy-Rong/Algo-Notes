//
//  加一 .swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/4.
//

import Foundation

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2cv1c/
func plusOne(_ digits: [Int]) -> [Int] {
    guard !digits.isEmpty else {
        return digits
    }
            
    var list = digits
    for i in (0 ..< list.count).reversed() {
        if list[i] == 9 {
            list[i] = 0
        }
        else {
            list[i] = (list[i] + 1)
            return list
        }
    }
    
    // 走到这里存在进位
    list.insert(1, at: 0)
    
    return list
}
