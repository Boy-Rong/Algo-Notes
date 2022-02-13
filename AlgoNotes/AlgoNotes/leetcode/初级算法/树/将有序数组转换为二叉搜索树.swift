//
//  将有序数组转换为二叉搜索树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/10.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xninbt/
import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard !nums.isEmpty else {
        return nil
    }
    
    let mid = nums.count / 2
    let left = sortedArrayToBST(Array(nums[0 ..< mid]))
    let right = sortedArrayToBST(Array(nums[mid + 1 ..< nums.count]))
    let root = TreeNode(val: nums[mid], left: left, right: right)
    return root
}
