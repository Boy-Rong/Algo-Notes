//
//  移动零.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/5.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    
    var index = 0
    for i in 0 ..< nums.count {
        if nums[i] != 0 {
            nums[index] = nums[i]
            index += 1
        }
    }
    
    for i in index ..< nums.count {
        nums[i] = 0
    }
}
