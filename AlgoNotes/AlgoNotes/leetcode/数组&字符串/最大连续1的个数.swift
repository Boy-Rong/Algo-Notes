//
//  最大连续1的个数.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

import Foundation

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var maxValue = 0
    var index = 0
    
    for i in 0 ..< nums.count {
        if nums[i] == 1 {
            index += 1
            maxValue = max(index, maxValue)
        }
        else {
            index = 0
        }
    }

    return maxValue
}
