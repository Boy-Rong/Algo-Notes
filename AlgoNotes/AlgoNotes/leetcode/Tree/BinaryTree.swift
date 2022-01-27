//
//  BinaryTree.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/24.
//

import Foundation

///// 节点协议
//public protocol BinaryTreeNodeable: AnyObject {
//    associatedtype Element
//    var element: Element { set get }
//    var leftNode: Self? { set get }
//    var rightNode: Self? { set get }
//    var parentNode: Self? { set get }
//}

/// 二叉树节点
public class BinaryTreeNode<Element> {
    public var element: Element
    public var leftNode: BinaryTreeNode<Element>?
    public var rightNode: BinaryTreeNode<Element>?
    public var parentNode: BinaryTreeNode<Element>?
    
    public init(element: Element) {
        self.element = element
    }
    
    var isLeftNode: Bool {
        self === parentNode?.leftNode
    }
    
    var isRightNode: Bool {
        self === parentNode?.rightNode
    }
    
    /// 叶子节点
    var isLeafNode: Bool {
        leftNode == nil && rightNode == nil
    }
    
    /// 度为1的节点
    var isSignleNode: Bool {
        (leftNode == nil && rightNode != nil) || (leftNode != nil && rightNode == nil)
    }
    
    /// 度为2的节点
    var isBinaryNode: Bool {
        parentNode?.leftNode != nil && parentNode?.rightNode != nil
    }
}

/// 二叉树基本协议
public protocol BinaryTreeable: AnyObject {
    associatedtype Element
    typealias Node = BinaryTreeNode<Element>
        
    var rootNode: Node? { set get }
    
    var count: Int { set get }
    
    var isEmpty: Bool { get }
    
    func contains(_ node: Node) -> Bool
    
    func clear()
}

extension BinaryTreeable {
    
    public var isEmpty: Bool {
        count == 0
    }
    
    public func contains(_ node: Node) -> Bool {
        var isContains = false
        levelOrderTraversal(node: rootNode, action: { current, depth in
            if node === current {
                isContains = true
            }
        })
        
        return isContains
    }
    
    public func clear() {
        var nodeList: [Node] = []
        inorderTraversal(node: rootNode) { nodeList.append($0) }
        
        // 将节点的所有引用打断，避免循环引用
        for node in nodeList {
            node.parentNode = nil
            node.leftNode = nil
            node.rightNode = nil
        }
        
        rootNode = nil
        count = 0
    }
    
}


// MARK: - 递归遍历
extension BinaryTreeable {
    
    /// 前序遍历
    func preorderTraversal(node: Node?, action: (Node) -> Void) {
        guard let currentNode = node else {
            return
        }
        
        // parent
        action(currentNode)
        
        // left
        preorderTraversal(node: currentNode.leftNode, action: action)
        
        // right
        preorderTraversal(node: currentNode.rightNode, action: action)
    }
    
    /// 中序遍历
    func inorderTraversal(node: Node?, action: (Node) -> Void) {
        guard let currentNode = node else {
            return
        }
        
        inorderTraversal(node: node?.leftNode, action: action)
        
        action(currentNode)
        
        inorderTraversal(node: node?.rightNode, action: action)
    }
    
    /// 后序遍历
    func postorderTraversal(node: Node?, action: (Node) -> Void) {
        guard let currentNode = node else {
            return
        }
        
        postorderTraversal(node: currentNode.leftNode, action: action)
        
        postorderTraversal(node: currentNode.rightNode, action: action)

        action(currentNode)
    }
    
}

// MARK: - 迭代遍历
extension BinaryTreeable {
    
    // 迭代前序遍历
    func iterativePreorderTraversal(node: Node?, action: (Node) -> Void) {
        guard let currentNode = node else {
            return
        }
        
        // 利用栈 先进后出
        var stack: Stack<Node> = .init([currentNode])
        
        while !stack.isEmpty {
            let node = stack.pop()
            action(node)
            
            if let right = node.rightNode {
                stack.push(right)
            }
            
            if let left = node.leftNode {
                stack.push(left)
            }
        }
        
    }
    
    /// 迭代中序遍历，使用的是模版方法（可用于前序、中序遍历）
    func iterativeInorderTraversal(node: Node?, action: (Node) -> Void) {
        guard node != nil else {
            return
        }
        
        // 利用栈 先进后出
        var stack: Stack<Node> = .init()
        
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
            action(topNode)
            currentNode = topNode.rightNode
        }
    }
    
    /// 层序遍历
    func levelOrderTraversal(node: Node?, action: (Node, Int) -> Void) {
        guard let currentNode = rootNode else {
            return
        }
        
        var queue: Queue<Node> = .init()
        queue.enqueue(element: currentNode)
        var depth = 1
        var depthSize = 1
        
        while !queue.isEmpty {
            if let node = queue.dequeue() {
                action(node, depth)
                
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

extension BinaryTreeable {
    
    /// 翻转链表-递归
    func invertBinaryTree() -> Node? {
        
        func invertBinaryTree(node: Node?) -> Node? {
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

// MARK: - 基本二叉树
class BinaryTree<Element>: BinaryTreeable {
    var rootNode: BinaryTreeNode<Element>?
    var count: Int = 0
    
}

// MARK: - 基本遍历方法
extension BinaryTree {
    
    func preorderTraversal() {
        preorderTraversal(node: rootNode, action: { value in
            debugPrint(value.element)
        })
    }
    
    func inorderTraversal() {
        inorderTraversal(node: rootNode, action: { value in
            debugPrint(value.element)
        })
    }
    
    func postorderTraversal() {
        postorderTraversal(node: rootNode, action: { value in
            debugPrint(value.element)
        })
    }
    
    func levelOrderTraversal() {
        levelOrderTraversal(node: rootNode, action: { value, _ in
            debugPrint(value.element)
        })
    }
    
}

// MARK: - 迭代遍历方法
extension BinaryTree {
    
    /// 迭代前序遍历
    func iterativePreorderTraversal() {
        
        iterativePreorderTraversal(node: rootNode, action: { value in
            debugPrint(value.element)
        })
    }
    
    func iterativeInorderTraversal() {
        
        iterativeInorderTraversal(node: rootNode, action: { value in
            debugPrint(value.element)
        })
        
    }

}

extension BinaryTree {
    
    
    
}
