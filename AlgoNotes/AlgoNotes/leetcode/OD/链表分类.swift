//
//  链表分类.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/6.
//

import Foundation

func listNode(_ head: ListNode?, _ k: Int) -> ListNode? {
    var current = head
    let left: ListNode? = .init(val: -1)
    let right: ListNode? = .init(val: -1)
    var leftCurrent = left
    var rightCurrent = right
    
    while current != nil {
        if (current?.val ?? 0) < k {
            leftCurrent?.next = current
            leftCurrent = leftCurrent?.next
        }
        else {
            rightCurrent?.next = current
            rightCurrent = rightCurrent?.next
        }
        current = current?.next
    }
    
    leftCurrent?.next = right?.next
    rightCurrent?.next = nil
    return left?.next
}
