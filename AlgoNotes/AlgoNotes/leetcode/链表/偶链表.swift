//
//  偶链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/25.
//

// https://leetcode-cn.com/leetbook/read/linked-list/fe0kj/
import Foundation

func oddEvenList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let evenHead = head?.next
    var odd = head
    var even = head?.next
    while odd != nil && even != nil {
        odd?.next = even?.next
        odd = odd?.next
        
        even?.next = odd?.next
        even = even?.next
    }
    
    var current = head
    while current?.next != nil {
        current = current?.next
    }
    current?.next = evenHead
    
    return head
}
