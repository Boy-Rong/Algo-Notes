//
//  旋转数组.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/3.
//

import Foundation

func rotate1(_ nums: inout [Int], _ k: Int) {
    guard nums.count > 1 && k > 0 else {
        return
    }
    
    let count = nums.count
    var kValue = k
    
    while kValue > 0 {
        let rightValue = nums[count - 1]
        
        for i in (1 ..< count).reversed() {
            nums[i] = nums[i - 1]
        }
        nums[0] = rightValue
        
        kValue -= 1
    }
    
}


func rotate(_ nums: inout [Int], _ k: Int) {
    guard nums.count > 1 else {
        return
    }
    
    let k = k % nums.count
    
    reversed(&nums, begin: 0, end: nums.count)
    reversed(&nums, begin: 0, end: k)
    reversed(&nums, begin: k, end: nums.count)
}

private func reversed(_ nums: inout [Int], begin: Int, end: Int) {
    var b = begin
    var e = end - 1
    
    while b < e {
        (nums[b], nums[e]) = (nums[e], nums[b])
        b += 1
        e -= 1
    }
}
