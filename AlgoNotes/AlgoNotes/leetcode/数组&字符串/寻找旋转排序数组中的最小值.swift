//
//  寻找旋转排序数组中的最小值.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/15.
//

// https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/

import Foundation

func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.first ?? 0
    }
    
    var begin = 0
    var end = nums.count - 1
    
    while begin < end {
        let mid = (begin + end) / 2
        if nums[mid] < nums[end] {
            end = mid
        }
        else if nums[mid] > nums[end] {
            begin = mid + 1
        }
    }
    
    return nums[end]
}

//func twoFind(_ list: inout [Int], begin: Int, ) -> Int {
//
//}
