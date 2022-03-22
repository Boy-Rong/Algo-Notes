//
//  排序的循环链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/26.
//

// https://leetcode-cn.com/problems/4ueAj6/
import Foundation

func insert(_ head: ListNode?, _ insertVal: Int) -> ListNode? {
    if head == nil {
        let node = ListNode.init(val: insertVal)
        node.next = node
        return node
    }
    
    var current = head
    var next = head?.next
    
    while next !== head {
        let currentValue = current?.val ?? .min
        let nextValue = next?.val ?? .max
        
        if (currentValue <= insertVal && insertVal <= nextValue) ||
            (currentValue > nextValue && insertVal >= currentValue) ||
            (currentValue > nextValue && insertVal <= nextValue) {
            break
        }
        
        current = current?.next
        next = next?.next
    }
    
    let node = ListNode.init(val: insertVal)
    node.next = next
    current?.next = node
    return head
}
