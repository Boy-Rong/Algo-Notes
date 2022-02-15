//
//  移除元素.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    
    var index = 0
    for i in 0 ..< nums.count {
        if nums[i] != val {
            nums[index] = nums[i]
            index += 1
        }
    }
    
    return index
}
