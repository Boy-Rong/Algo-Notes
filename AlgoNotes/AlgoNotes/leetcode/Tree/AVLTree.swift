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
    
    /// 默认新创建的节点高度为 1
    public var height: Int = 1
    
    /// 是否平衡
    public var isBalanced: Bool {
        let leftHeight = leftNode?.height ?? 0
        let rightHeight = rightNode?.height ?? 0
        let diff = abs(leftHeight - rightHeight)
        return diff <= 1
    }
    
    /// 高度高的子节点
    public var tallerChildNode: AVLTreeNode<Element>? {
        let leftHeight = leftNode?.height ?? 0
        let rightHeight = rightNode?.height ?? 0
        
        if leftHeight > rightHeight {
            return leftNode
        }
        if leftHeight < rightHeight {
            return rightNode
        }
        return nil
    }
    
    public init(element: Element) {
        self.element = element
    }
    
}

// MARK: - AVL 树
public class AVLTree<Element: Comparable>: BinarySearchTreeable {
    
    public var rootNode: AVLTreeNode<Element>?
    public var count: Int = 0
    
    public func afterAppdend(_ node: AVLTreeNode<Element>?) {
        var current = node?.parentNode
        while current != nil {
            // 父节点平衡，更新父节点的高度
            if current?.isBalanced ?? false {
                updateHeight(current)
            }
            // 恢复平衡
            else {
                reBalanced(current)
                // 树中最低的节点恢复平衡，整棵树就平衡了。结算向上寻找
                return
            }
            
            // 继续向上找失去平衡的节点
            current = current?.parentNode
        }
        
    }
    
    public func afterRemove(_ node: AVLTreeNode<Element>?) {
        
    }
    
}

extension AVLTree {
    
    /// 恢复平衡，失衡的节点肯定有3层（平衡因子 > 1）
    func reBalanced(_ node: Node?) {
        guard
            let grandNode = node,
            !grandNode.isBalanced,
            let parentNode = grandNode.tallerChildNode,
            let node = parentNode.tallerChildNode
        else {
            return
        }
        
        // LL
        if node.isLeftNode && parentNode.isLeftNode {
            reBalanced(
                node: grandNode,
                b: node, c: node.rightNode,
                d: parentNode,
                e: parentNode.rightNode, f: grandNode
            )
        }
        // RR
        else if node.isRightNode && parentNode.isRightNode {
            reBalanced(
                node: grandNode,
                b: grandNode, c: parentNode.leftNode,
                d: parentNode,
                e: node.leftNode, f: node
            )
        }
        // LR
        else if node.isLeftNode && parentNode.isRightNode {
            reBalanced(
                node: grandNode,
                b: parentNode, c: node.leftNode,
                d: node,
                e: node.rightNode, f: grandNode
            )
        }
        //RL
        else {
            reBalanced(
                node: grandNode,
                b: grandNode, c: node.leftNode,
                d: node,
                e: node.rightNode, f: parentNode
            )
        }
    }
    
    /// 统一的平衡二叉搜索树逻辑
    /// - Parameters:
    ///   - node: 失衡的节点
    ///   a,b,c,d,e,f,g 分别为失衡情况下中序遍历的顺序节点
    ///       d
    ///    b     f
    ///  a  c   e  g
    func reBalanced(
        node: Node,
        b: Node, c: Node?,
        d: Node,
        e: Node?, f: Node
    ) {
            
            // 根节点
            if node.parentNode == nil {
                rootNode = d
                d.parentNode = nil
            }
            else {
                if node.isLeftNode {
                    node.parentNode?.leftNode = d
                } else {
                    node.parentNode?.rightNode = d
                }
                d.parentNode = node.parentNode
            }
            
            // 变换后需要更新b的高度
            b.rightNode = c
            c?.parentNode = b
            updateHeight(b)
            
            // 变换后需要更新f的高度
            f.leftNode = e
            e?.parentNode = f
            
            // 最后变换d，先更新b f的高度，在更新d的高度才是正确的
            d.leftNode = b
            d.rightNode = f
            b.parentNode = d
            f.parentNode = d
            updateHeight(d)
    }
    
    
    /// 更新当前节点的高度
    func updateHeight(_ node: Node?) {
        guard let node = node else {
            return
        }
        
        let leftHeight = node.leftNode?.height ?? 0
        let rightHeight = node.rightNode?.height ?? 0
        node.height = max(leftHeight, rightHeight) + 1
    }
    
}

extension AVLTree {
    
}
