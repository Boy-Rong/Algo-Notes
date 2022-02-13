//
//  删除链表的倒数第N个节点.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn2925/
import Foundation
import UIKit

/// 遍历长度求解
func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard head != nil, n > 0 else {
        return nil
    }
    
    var currentNode = head
    var count = 0
    while currentNode != nil {
        count += 1
        currentNode = currentNode?.next
    }
    
    if count == 1 {
        return nil
    }
    
    // 尾节点
    if n == 1 {
        let node = node(head, index: count - 2)
        node?.next = nil
    } else {
        let size = count - n
        deleteNode(node(head, index: size))
    }
    
    return head
}

func node(_ head: ListNode?, index: Int) -> ListNode? {
    var i = 0
    var current = head
    while i < index {
        current = current?.next
        i += 1
    }
    
    return current
}


/// 双指针求解
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard head != nil, n > 0 else {
        return nil
    }
    
    let dumpHead = ListNode()
    dumpHead.next = head
    
    var current: ListNode? = dumpHead
    var pNode: ListNode?  = dumpHead
    
    var i = 0
    while i <= n {
        pNode = pNode?.next
        i += 1
    }
    
    while pNode != nil {
        current = current?.next
        pNode = pNode?.next
    }
    
    current?.next = current?.next?.next
    
    return dumpHead.next
}
