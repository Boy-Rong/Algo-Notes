//
//  CircularLinkedList.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/22.
//

import Foundation

// MARK: - 双向链表节点
class DoublyLinkedNode<Elements: Equatable> {
    var element: Elements
    var previous: DoublyLinkedNode<Elements>?
    var next: DoublyLinkedNode<Elements>?
    
    init(element: Elements, previous: DoublyLinkedNode<Elements>? = nil, next: DoublyLinkedNode<Elements>? = nil) {
        self.element = element
        self.previous = previous
        self.next = next
    }
}

// MARK: - 双向循环链表
class DoublyCircularLinkedList {
    
    var headNode: DoublyLinkedNode<Int>?
    var tailNode: DoublyLinkedNode<Int>?
    
    var count: Int = 0
    
    var isEmpty: Bool {
        count == 0
    }
}

extension DoublyCircularLinkedList: LinkedListable {
    
    func add(element: Int, in index: Int) {
        guard index >= 0 && index <= count else {
            return
        }
        
        guard !isEmpty else {
            let newNode = DoublyLinkedNode<Int>(
                element: element,
                previous: nil,
                next: nil
            )
            newNode.previous = newNode
            newNode.next = newNode
            
            headNode = newNode
            tailNode = newNode
            
            count += 1
            return
        }
        
        let idx = index % count
        let currentNode = node(idx)
        
        let newNode = DoublyLinkedNode<Int>(
            element: element,
            previous: currentNode?.previous,
            next: currentNode
        )
        
        currentNode?.previous?.next = newNode
        currentNode?.previous = newNode
        
        if index == 0 {
            headNode = currentNode
        }
        
        if index == count {
            tailNode = currentNode
        }
        
        count += 1
    }
    
    func remove(at index: Int) {
        guard checkLegality(index) && !isEmpty else {
            return
        }
        
        guard count > 1 else {
            headNode = nil
            tailNode = nil
            
            return
        }
        
        let currentNode = node(index)
        let previous = currentNode?.previous
        let next = currentNode?.next
        
        previous?.next = next
        next?.previous = previous
        
        if index == 0 {
            headNode = next
        }
        
        if  index == count - 1 {
            tailNode = previous
        }
        
        count -= 1
    }
    
    func get(_ index: Int) -> Int? {
        guard checkLegality(index) else {
            return nil
        }
        
       return node(index)?.element
    }
    
}


extension DoublyCircularLinkedList {
    
    private func node(_ index: Int) -> DoublyLinkedNode<Int>? {
        guard checkLegality(index) else {
            return nil
        }
                    
        // 从前面找
        if index <= count / 2 {
            var node = headNode
            var i = 0
            while i < index {
                node = node?.next
                i += 1
            }
            
            return node
        }
        // 从后面开始找
        else {
            var node = tailNode
            var i = count - 1
            
            while i > index {
                node = node?.previous
                i -= 1
            }
            
            return node
        }
    }
    
    private func checkLegality(_ index: Int) -> Bool {
        guard index >= 0 && index < count else {
            debugPrint("index: \(index) 越界")
            return false
        }
        
        return true
    }

}
    
