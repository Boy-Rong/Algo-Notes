//
//  LinkedList.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/20.
//

import Foundation

// MARK: - 链表基础结构

protocol LinkedNodeable : AnyObject {
    associatedtype Element: Equatable
    associatedtype Node: LinkedNodeable
    
    var element: Element { get }
    var next: Node? { get }
}

protocol LinkedListable {
    associatedtype Element: Equatable
    
    func add(element: Element, in index: Int)
    
    func remove(at index: Int)
    
    func get(_ index: Int) -> Element?
    
}

// MARK: - LinkedList
class LinkedNode<Element: Equatable>: LinkedNodeable {
    var element: Element
    var next: LinkedNode<Element>?
    
    init(element: Element, next: LinkedNode<Element>? = nil) {
        self.element = element
        self.next = next
    }
}




class LinkedList {
    
}


