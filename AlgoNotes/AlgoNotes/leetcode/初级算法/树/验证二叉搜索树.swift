//
//  验证二叉搜索树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn08xg/
import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    
    return isValidBST(root, min: Int.min, max: Int.max)
}

func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
    guard let root = root else {
        return true
    }
    
    // 两种方式都可以，一种是判断 root 是否符合区间、一种是判断左右子数是否符合
//    if let left = root.left, left.val <= min || left.val >= root.val {
//        return false
//    }
//    if let right = root.right, right.val >= max || right.val <= root.val {
//        return false
//    }
    
    if root.val <= min || root.val >= max {
        return false
    }
    
    let left = isValidBST(root.left, min: min, max: root.val)
    let right = isValidBST(root.right, min: root.val , max: max)
    return left && right
}
