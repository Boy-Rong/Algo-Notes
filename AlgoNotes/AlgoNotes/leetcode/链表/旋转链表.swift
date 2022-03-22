//
//  旋转链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/25.
//

// https://leetcode-cn.com/leetbook/read/linked-list/f00a2/
import Foundation

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || k == 0 {
        return head
    }
    
    var size = 0
    var current = head
    while current != nil {
        size += 1
        current = current?.next
    }
    
    var count = k % size
    var fast = head
    var slow = head
    
    while count > 0 {
        fast = fast?.next
        count -= 1
    }
    
    if fast === slow {
        return head
    }
    
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    let next = slow?.next
    slow?.next = nil
    fast?.next = head
    
    return next
}
