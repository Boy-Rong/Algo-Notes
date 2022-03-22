//
//  链表排序.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/26.
//

// https://leetcode-cn.com/problems/7WHec2/
import Foundation

func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var slow = head
    var fast = head?.next
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    let mid = slow?.next
    slow?.next = nil
    
    let node1 = sortList(head)
    let node2 = sortList(mid)
    
    return mergeList(node1: node1, node2: node2)
}

func mergeList(node1: ListNode?, node2: ListNode?) -> ListNode? {
    let preNode: ListNode? = .init(val: 0)
    var current = preNode
    var current1 = node1
    var current2 = node2
    while current1 != nil && current2 != nil {
        if (current1?.val ?? .min) < (current2?.val ?? .min) {
            current?.next = current1
            current1 = current1?.next
        }
        else {
            current?.next = current2
            current2 = current2?.next
        }
        
        current = current?.next
    }
    if current1 != nil {
        current?.next = current1
    }
    else if current2 != nil {
        current?.next = current2
    }

    return preNode?.next
}
