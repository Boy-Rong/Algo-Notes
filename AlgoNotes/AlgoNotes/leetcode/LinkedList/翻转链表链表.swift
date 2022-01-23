//
//  链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/20.
//

import Foundation


typealias Node = LinkedNode<Int>

// https://leetcode-cn.com/problems/reverse-linked-list/
// MARK: - 翻转链表

/// 迭代法
func reverseList1(_ node: Node?) -> Node? {
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

/// 递归法
func reverseList2(_ node: Node?) -> Node? {
    if node?.next == nil || node == nil {
        return node
    }
    
    let newNode = reverseList2(node?.next)
    node?.next?.next = node
    node?.next = nil
    
    return newNode
}


// MARK: - 循环链表

func hasCycle(_ head: Node?) -> Bool {
    var fastNode = head
    var slowNode = head
    
    var cycle = false
    
    while fastNode != nil {
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
        
        if fastNode?.element == slowNode?.element {
            cycle = true
            break
        }
    }
    
    return cycle
}


// MARK: - 练习
func removeElements(_ head: Node?, _ val: Int) -> Node? {
    if head == nil {
        return head
    }
    
    var current = head
    
    while current != nil {
        let next = current?.next
        
        // 删除
        if current?.element == val {
            current?.element = next?.element ?? 0
            current?.next = next?.next
        }
        // 继续迭代
        else {
            current = next
        }
    }
    
    return head
}
