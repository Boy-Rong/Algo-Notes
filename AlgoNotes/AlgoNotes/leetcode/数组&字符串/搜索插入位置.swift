//
//  搜索插入位置.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/13.
//

// https://leetcode-cn.com/leetbook/read/array-and-string/cxqdh/
import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var begin = 0
    var end = nums.count
    
    
    while begin < end {
        let mid = (begin + end) / 2
        if nums[mid] == target {
            return mid
        }
        
        if target < nums[mid] {
            end = mid
        }
        else {
            begin = mid + 1
        }
    }

    return end
}
