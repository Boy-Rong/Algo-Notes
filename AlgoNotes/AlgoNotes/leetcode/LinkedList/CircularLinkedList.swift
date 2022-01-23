//
//  CircularLinkedList.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/22.
//

import Foundation

// MARK: - 单向循环链表
class CircularLinked {
    
    var headNode: LinkedNode<Int>?
    
    var count: Int = 0
    
    var isEmpty: Bool {
        count == 0
    }
    
}

extension CircularLinked: LinkedListable {
    
    func add(element: Int, in index: Int) {
        if index == 0 {
            let newNode = LinkedNode<Int>(element: element, next: headNode)
            headNode = newNode
            let last = isEmpty ? newNode : node(count - 1)
            last?.next = newNode
        }
        else {
            let previous = node(index - 1)
            let next = previous?.next
            let newNode = LinkedNode<Int>(element: element, next: next)
            previous?.next = newNode
        }
        
        count += 1
    }
    
    func remove(at index: Int) {
        guard !isEmpty && checkLegality(index) else {
            return
        }
        
        if index == 0 {
            if count == 1 {
                headNode = nil
            }
            else {
                let last = node(count - 1)
                headNode = headNode?.next
                last?.next = headNode
            }
        }
        else {
            let previous = node(index - 1)
            let next = previous?.next?.next
            previous?.next = next
        }
        
        count -= 1
    }
    
    func get(_ index: Int) -> Int? {
        node(index)?.element
    }
    
}

extension CircularLinked {
    
    private func node(_ index: Int) -> LinkedNode<Int>? {
        guard checkLegality(index) else {
            return nil
        }
        
        var node = headNode
        var i = 0
        
        while i < index {
            node = node?.next
            i += 1
        }
        
        return node
    }
    
    private func checkLegality(_ index: Int) -> Bool {
        guard index >= 0 && index < count else {
            debugPrint("index: \(index) 越界")
            return false
        }
        
        return true
    }
    
}
