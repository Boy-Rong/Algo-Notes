//
//  链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/20.
//

import Foundation
import UIKit

// MARK: - 链表基础结构

class LinkedList {
    
}

class LinkedNode<Element: Equatable> {
    var element: Element
    var next: LinkedNode<Element>?
    
    init(element: Element, next: LinkedNode<Element>? = nil) {
        self.element = element
        self.next = next
    }
}

typealias Node = LinkedNode<Int>

// https://leetcode-cn.com/problems/reverse-linked-list/
// MARK: - 翻转链表

/// 迭代法
func reverseList(_ node: Node?) -> Node? {
    var head = node
    var tempNode: Node? = nil
    
    while head != nil {
        let nextNode = head?.next
        head?.next = tempNode
        tempNode = head
        head = nextNode
    }
        
    return tempNode
}



