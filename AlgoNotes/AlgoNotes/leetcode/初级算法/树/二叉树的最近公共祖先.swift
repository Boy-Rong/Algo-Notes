//
//  二叉树的最近公共祖先.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/3.
//

import Foundation
import UIKit

/*
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    var queue: Queue<TreeNode> = .init()
    queue.enqueue(element: root)
    
    var praentMap: [TreeNode : TreeNode] = [:]
    
    while !queue.isEmpty {
        let node = queue.dequeue()
        
        if let left = node?.left {
            queue.enqueue(element: left)
            
            praentMap[left] = node
        }
        if let right = node?.right {
            queue.enqueue(element: right)
            
            praentMap[right] = node
        }
    }
    
    var pNode = p
    var pPath: [TreeNode] = []
    while pNode != nil {
        guard let node = pNode else {
            break
        }
        
        pPath.append(node)
        pNode = praentMap[node]
    }
    
    var qNode = q
    while qNode != nil && !pPath.contains(qNode!) {
        qNode = praentMap[qNode!]
    }
    
    return qNode
}
*/

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || p === root || q === root {
        return root
    }
    
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    
    if left != nil && right != nil {
        return root
    }
    else if left == nil && right != nil {
        return right
    }
    else if left != nil && right == nil {
        return left
    }
    
    return nil
}
