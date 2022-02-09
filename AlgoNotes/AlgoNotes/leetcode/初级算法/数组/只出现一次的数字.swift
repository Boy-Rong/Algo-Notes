//
//  只出现一次的数字.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/3.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums[0]
    }
    
    var list = nums
    list.sort()
    
    var i = 1

    while i < list.count {
        if list[i] == list[i - 1] {
            i += 2
        }
        else {
            return list[i]
        }
    }
    
    return 0
}
