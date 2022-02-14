//
//  数组拆分 I.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

// https://leetcode-cn.com/leetbook/read/array-and-string/c24he/

import Foundation

func arrayPairSum(_ nums: [Int]) -> Int {
    let list = nums.sorted { $0 < $1 }
    
    var left = 0
    var right = left + 1
    var max = 0
    
    while right < list.count {
        max += min(list[left], list[right])
        left = right + 1
        right = left + 1
    }
    
    return max
}
