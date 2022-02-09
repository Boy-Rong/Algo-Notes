//
//  删除排序数组中的重复项.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/3.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2gy9m/
import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    
    var index = 0
    for i in 1 ..< nums.count {
        if nums[i] != nums[i - 1] {
            index += 1
            nums[index] = nums[i]
        }
    }
    
    return index + 1
}
