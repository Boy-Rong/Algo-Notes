//
//  对称二叉树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/10.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn7ihv/

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    if root?.left == nil && root?.right == nil {
        return true
    }
    guard let left = root?.left, let right = root?.right else {
        return false
    }
    
    var statck = Stack<(TreeNode, Bool)>()
    
    readNode(root: left, flat: true) { (node, flat) in
        statck.push((node, flat))
    }
    
    var value = true
    readNode(root: right, flat: false) { (node, flat) in
        if statck.count > 0 {
            let (stackNode, stackFlat) = statck.pop()
            let isEqual = node.val == stackNode.val && flat == !stackFlat
            value = value && isEqual
        }
        else {
            value = false
        }
    }
    
    return statck.isEmpty && value
}

func readNode(root: TreeNode?, flat: Bool, action: (TreeNode, Bool) -> Void) {
    guard root != nil else {
        return
    }
    
    readNode(root: root?.left, flat: true, action: action)
    if let node = root {
        action(node, flat)
    }
    readNode(root: root?.right, flat: false, action: action)
}

//func reversalTree(root: TreeNode?) {
//    guard root != nil else {
//        return
//    }
//
//    (root?.left, root?.right) = (root?.right, root?.left)
//    reversalTree(root: root?.left)
//    reversalTree(root: root?.right)
//}
