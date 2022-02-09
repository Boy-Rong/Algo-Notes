//
//  平衡二叉树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/2.
//

// https://leetcode-cn.com/problems/balanced-binary-tree/
import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    let leftHeight = treeHeight(root: root?.left)
    let rightHeight = treeHeight(root: root?.right)
    let isBalanced = abs(leftHeight - rightHeight) < 2
    return isBalanced
}

func treeHeight(root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    if root?.left == nil && root?.right == nil {
        return 1
    }
    
    let leftHeight = treeHeight(root: root?.left)
    let rightHeight = treeHeight(root: root?.right)
    return max(leftHeight, rightHeight) + 1
}
