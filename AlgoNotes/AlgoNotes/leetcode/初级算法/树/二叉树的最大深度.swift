//
//  二叉树的最大深度.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnd69e/
import Foundation


func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    let leftHeight = maxDepth(root?.left)
    let rightHeight = maxDepth(root?.right)
    let height = max(leftHeight, rightHeight) + 1
    return height
}
