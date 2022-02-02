//
//  合并两个有序数组.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/2.
//

// https://leetcode-cn.com/problems/merge-sorted-array/
import Foundation

public func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var li = m - 1
    var ri = n - 1
    var ai = m + n - 1
    
    while ri >= 0 {
        if li >= 0 {
            if nums1[li] > nums2[ri] {
                nums1[ai] = nums1[li]
                li -= 1
            }
            else {
                nums1[ai] = nums2[ri]
                ri -= 1
            }
        }
        else {
            nums1[ai] = nums2[ri]
            ri -= 1
        }
        
        ai -= 1
    }
}
