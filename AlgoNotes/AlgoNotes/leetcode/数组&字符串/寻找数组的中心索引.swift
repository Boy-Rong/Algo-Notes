//
//  寻找数组的中心索引.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/13.
//

import Foundation

func pivotIndex(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return 0
    }
    
    var leftValue = 0
    var rightValue = 0
    for i in 1 ..< nums.count {
        rightValue += nums[i]
    }
    
    var index = 0
    while index < nums.count {
        if leftValue == rightValue {
            return index
        }
        
        // 最后一个元素还没有找到
        if index == nums.count - 1 {
            return -1
        }
        
        leftValue += nums[index]
        index += 1
        rightValue -= nums[index]
    }
    
    return -1
}
