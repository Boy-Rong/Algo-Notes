//
//  反转链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

import Foundation

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnnhm6/
func reverseList1(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    
    let node = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    
    return node
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    
    var tepNode: ListNode?
    var current = head
    
    while current != nil {
        let next = current?.next
        current?.next = tepNode
        tepNode = current
        current = next
    }
    
    return tepNode
}
