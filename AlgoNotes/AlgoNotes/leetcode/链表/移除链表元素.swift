//
//  移除链表元素.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/25.
//

import Foundation

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let preHead: ListNode? = .init(val: -1, next: head)
    var current = preHead
    while current?.next != nil {
        if current?.next?.val == val {
            current?.next = current?.next?.next
        }
        else {
            current = current?.next
        }
    }
    
    return preHead?.next
}
