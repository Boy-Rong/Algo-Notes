//
//  LinkedList.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/20.
//

import Foundation

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
