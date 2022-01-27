//
//  BinarySearchTree.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/27.
//

import Foundation

// MARK: - 二叉搜索树
public class BinarySearchTree<Element: Comparable>: BinaryTreeable {
    typealias Node = BinaryTreeNode<Element>
    
    public var rootNode: BinaryTreeNode<Element>?
    public var count: Int = 0
    
    /// 添加元素
    func append(_ element: Element) {
        guard rootNode == nil else {
            rootNode = .init(element: element)
            count += 1
            return
        }
        
        var currentNode: Node? = rootNode
        var parentNode: Node? = rootNode
        
        while currentNode != nil {
            guard let currentElement = currentNode?.element else {
                return
            }
            
            parentNode = currentNode
            
            if element > currentElement {
                currentNode = currentNode?.rightNode
            }
            else if element < currentElement {
                currentNode = currentNode?.leftNode
            }
            else {
                currentNode?.element = element
                return
            }
        }
        
        guard let parent = parentNode else {
            return
        }
        
        let node = BinaryTreeNode<Element>(element: element)
        node.parentNode = parent
        
        if element > parent.element {
            parent.rightNode = node
        }
        else {
            parent.leftNode = node
        }
        
        count += 1
    }
    
    
    /// 移除元素
    func remove(_ element: Element) {
        guard var node = node(element) else {
            return
        }
        
        // 删除度为2的节点
        if node.isBinaryNode {
            guard let predecessor = predecessorNode(node) else {
                return
            }
            
            // 找到前驱节点并替换当前node的值
            node.element = predecessor.element
            predecessor.element = node.element
            
            // 记录前驱节点，在后面的逻辑中删除。前驱节点度 只可能为 0 或 1
            node = predecessor
        }
        
        // 删除 非根叶子节点
        if node.isLeafNode && node.parentNode != nil {
            if node.isLeftNode {
                node.parentNode?.leftNode = nil
            }
            else {
                node.parentNode?.rightNode = nil
            }
            node.parentNode = nil
        }
        // 度为1的非根节点
        else if node.isSignleNode && node.parentNode != nil {
            var child: Node?
            if let left = node.leftNode {
                child = left
            }
            else if let right = node.rightNode {
                child = right
            }
            
            if node.isLeftNode {
                node.parentNode?.leftNode = child
            }
            else if node.isRightNode {
                node.parentNode?.rightNode = child
            }
            child?.parentNode = node.parentNode
        }
        // 度为1的根节点
        else if node.isSignleNode && node.parentNode == nil {
            let child = node.isLeftNode ? node.leftNode : node.rightNode
            child?.parentNode = nil
            rootNode = child
        }
        // 只有根节点
        else {
            rootNode = nil
        }
        
        count -= 1
    }
    
}

extension BinarySearchTree {
    
    private func node(_ element: Element) -> Node? {
        var current = rootNode
        
        while current != nil {
            guard let currentElement = current?.element else {
                return nil
            }
            
            if element > currentElement {
                current = current?.rightNode
            }
            else if element < currentElement {
                current = current?.leftNode
            }
            else {
                return current
            }
        }
        
        return nil
    }
    
}

// MARK: - 前驱 & 后继
extension BinarySearchTree {
    
    /// 找前驱节点，前一个小的节点
    func predecessorNode(_ node: Node?) -> BinaryTreeNode<Element>? {
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
