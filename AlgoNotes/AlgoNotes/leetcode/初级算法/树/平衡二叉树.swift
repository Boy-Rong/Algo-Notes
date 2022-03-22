//
//  平衡二叉树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/2.
//

// https://leetcode-cn.com/problems/balanced-binary-tree/
import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return true
    }
    guard root?.left == nil && root?.right == nil else {
        return true
    }
    
    let balanced = isBalanced(root?.left) && isBalanced(root?.right)
    let leftHeight = treeHeight(root: root?.left)
    let rightHeight = treeHeight(root: root?.right)
    return abs(leftHeight - rightHeight) < 2 && balanced
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }

    var list: [[Int]] = []

    var queue = Queue<TreeNode>()
    var lCount = 0
    if let root = root {
        queue.enqueue(element:root)
        lCount += 1
    }

    var subList: [TreeNode] = []
    while !queue.isEmpty {
        guard let value = queue.dequeue() else  {
            continue
        }
        
        lCount -= 1
        subList.append(value)
        if let left = value.left {
            queue.enqueue(element: left)
        }
        if let right = value.right {
            queue.enqueue(element: right)
        }

        if lCount == 0 {
            list.append(subList.map({ $0.val }))
            lCount = queue.count
            subList = []
        }
    }
    
    return list
}
