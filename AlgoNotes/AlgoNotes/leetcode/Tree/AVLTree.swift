//
//  AVLTree.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/28.
//

import Foundation

public final class AVLTreeNode<Element>: BinaryTreeNodeable {
    public var element: Element
    
    public var leftNode: AVLTreeNode<Element>?
    
    public var rightNode: AVLTreeNode<Element>?
    
    public var parentNode: AVLTreeNode<Element>?
    
    // 默认新创建的节点高度为 1
    public var heighe: Int = 1
    
    public init(element: Element) {
        self.element = element
    }
    
}

// MARK: - AVL 树
public class AVLTree<Element: Comparable>: BinarySearchTreeable {
    
    public var rootNode: AVLTreeNode<Element>?
    public var count: Int = 0
    
}

extension AVLTree {
    
    public func afterAppdend(_ node: AVLTreeNode<Element>?) {
        
    }
    
    public func afterRemove(_ node: AVLTreeNode<Element>?) {
        
    }
    
}
