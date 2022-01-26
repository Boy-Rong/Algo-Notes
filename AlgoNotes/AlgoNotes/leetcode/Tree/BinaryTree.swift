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

extension BinaryTree {
    
    // 迭代前序遍历
    func iterativePreorderTraversal() {
        
        let action: (Element) -> Void = { value in
            debugPrint(value)
        }
        
        let currentNode = rootNode
        var leftNode = currentNode?.leftNode
        var rightNode = currentNode?.rightNode
        
        if let node = currentNode {
            action(node.element)
        }
        
        while leftNode != nil {
            if let node = leftNode {
                action(node.element)
            }
            
            leftNode = leftNode?.leftNode
        }
        
        while rightNode != nil {
            if let right = rightNode {
                action(right.element)
            }
            
            rightNode = rightNode?.rightNode
        }
                
    }
    
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
