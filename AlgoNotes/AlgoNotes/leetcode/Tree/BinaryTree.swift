//
//  BinaryTree.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/24.
//

import Foundation

class BinaryTreeNode<Element: Equatable> {
    var element: Element
    var leftNode: BinaryTreeNode<Element>?
    var rightNode: BinaryTreeNode<Element>?
    var parentNode: BinaryTreeNode<Element>?
    
    init(element: Element) {
        self.element = element
    }
}


class BinaryTree<Element: Equatable> {
    
    var rootNode: BinaryTreeNode<Element>?
    
}

// MARK: - 基本遍历方法
extension BinaryTree {
    
    func preorderTraversal() {
        
        func preorderTraversal(node: BinaryTreeNode<Element>?, action: (Element) -> Void) {
            guard let currentNode = node else {
                return
            }
            
            // parent
            action(currentNode.element)
            
            // left
            preorderTraversal(node: currentNode.leftNode, action: action)
            
            // right
            preorderTraversal(node: currentNode.rightNode, action: action)
        }
        
        preorderTraversal(node: rootNode, action: { value in
            debugPrint(value)
        })
    }
    
    func inorderTraversal() {
        
        func inorderTraversal(node: BinaryTreeNode<Element>?, action: (Element) -> Void) {
            guard let currentNode = node else {
                return
            }
            
            inorderTraversal(node: node?.leftNode, action: action)
            
            action(currentNode.element)
            
            inorderTraversal(node: node?.rightNode, action: action)
        }
        
        inorderTraversal(node: rootNode, action: { value in
            debugPrint(value)
        })
    }
    
    func postorderTraversal() {
        
        func postorderTraversal(node: BinaryTreeNode<Element>?, action: (Element) -> Void) {
            guard let currentNode = node else {
                return
            }
            
            postorderTraversal(node: currentNode.leftNode, action: action)
            
            postorderTraversal(node: currentNode.rightNode, action: action)

            action(currentNode.element)
        }
        
        postorderTraversal(node: rootNode, action: { value in
            debugPrint(value)
        })
    }
    
    func levelOrderTraversal() {
        levelOrderTraversal(node: rootNode, action: { value, _ in
            debugPrint(value)
        })
    }
    
    func levelOrderTraversal(node: BinaryTreeNode<Element>?, action: (Element, Int) -> Void) {
        guard let currentNode = rootNode else {
            return
        }
        
        var queue: Queue<BinaryTreeNode<Element>> = .init()
        queue.enqueue(element: currentNode)
        var depth = 1
        var depthSize = 1
        
        while !queue.isEmpty {
            if let node = queue.dequeue() {
                action(node.element, depth)
                
                depthSize -= 1
            }
            
            if let leftNode = currentNode.leftNode {
                queue.enqueue(element: leftNode)
            }
            
            if let rightNode = currentNode.rightNode {
                queue.enqueue(element: rightNode)
            }
            
            if depthSize == 0 {
                depthSize = queue.count
                depth += 1
            }
            
        }
    }
    
}

// MARK: - 迭代遍历方法
extension BinaryTree {
    
    /// 迭代前序遍历
    func iterativePreorderTraversal() {
        
        // 迭代前序遍历
        func iterativePreorderTraversal(node: BinaryTreeNode<Element>?, action: (Element) -> Void) {
            guard let currentNode = node else {
                return
            }
            
            // 利用栈 先进后出
            var stack: Stack<BinaryTreeNode<Element>> = .init([currentNode])
            
            while !stack.isEmpty {
                let node = stack.pop()
                action(node.element)
                
                if let right = node.rightNode {
                    stack.push(right)
                }
                
                if let left = node.leftNode {
                    stack.push(left)
                }
            }
            
        }
        
        iterativePreorderTraversal(node: rootNode, action: { value in
            debugPrint(value)
        })
    }
    
    func iterativeInorderTraversal() {
        
        /// 模版方法
        func iterativeInorderTraversal(node: BinaryTreeNode<Element>?, action: (Element) -> Void) {
            guard node != nil else {
                return
            }
            
            // 利用栈 先进后出
            var stack: Stack<BinaryTreeNode<Element>> = .init()
            
            var currentNode = node
            
            while !stack.isEmpty || currentNode != nil {
                // 先将left节点全部入栈
                while currentNode != nil {
                    if let node = currentNode {
                        stack.push(node)
                        currentNode = currentNode?.leftNode
                    }
                }
                
                let topNode = stack.pop()
                action(topNode.element)
                currentNode = topNode.rightNode
            }
        }
        
        iterativeInorderTraversal(node: rootNode, action: { value in
            debugPrint(value)
        })
        
    }

}

extension BinaryTree {
    /// 翻转链表
    func invertBinaryTree() -> BinaryTreeNode<Element>? {
        
        func invertBinaryTree(node: BinaryTreeNode<Element>?) -> BinaryTreeNode<Element>? {
            guard let currentNode = node else {
                return nil
            }
            
            let left = invertBinaryTree(node: currentNode.leftNode)
            let right = invertBinaryTree(node: currentNode.rightNode)
            
            currentNode.leftNode = right
            currentNode.rightNode = left
            
            return currentNode
        }
        
        return invertBinaryTree(node: rootNode)
    }
}

extension BinaryTree {
    
    /// 找前驱节点，前一个小的节点
    func predecessorNode(_ node: BinaryTreeNode<Element>?) -> BinaryTreeNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        // leftNode == nil 的根节点
        if node.leftNode == nil && node.parentNode == nil {
            return nil
        }
        
        if node.leftNode != nil {
            var current = node.leftNode
            while current?.rightNode != nil {
                current = current?.rightNode
            }
            return current
        }
        
        // left == nil && parentNode != nil
        var currentNode: BinaryTreeNode<Element>? = node
        
        // currentNode 是 rihgtNode 结束遍历，此时 rightNode.parentNode 一定比 node 小（因为是二叉搜索树）
        while currentNode?.parentNode != nil && currentNode === currentNode?.parentNode?.leftNode {
            currentNode = currentNode?.parentNode
        }
        
        return currentNode?.parentNode
    }
    
    /// 后继节点，后一个大的节点
    func successorNode(_ node: BinaryTreeNode<Element>?) -> BinaryTreeNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if node.rightNode == nil && node.parentNode == nil {
            return nil
        }
        
        if node.rightNode != nil {
            var currentNode = node.rightNode
            
            while currentNode?.leftNode != nil {
                currentNode = currentNode?.leftNode
            }
            
            return currentNode
        }
        
        // right == nil && parentNode != nil
        var currentNode: BinaryTreeNode<Element>? = node
        
        while currentNode?.parentNode != nil && currentNode === currentNode?.parentNode?.rightNode {
            currentNode = currentNode?.parentNode
        }
        
        return currentNode?.parentNode
    }
    
}
