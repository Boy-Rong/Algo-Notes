//
//  两数相加.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/23.
//

// https://leetcode-cn.com/leetbook/read/linked-list/fv6w7/

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var current1 = l1
    var current2 = l2
    var carry = 0
    let node: ListNode = .init(val: 0)
    var currentNode: ListNode? = node
    while current1 != nil || current2 != nil {
        let value = (current1?.val ?? 0) + (current2?.val ?? 0) + carry
        currentNode?.next = .init(val: value % 10)
        carry = value / 10
                
        currentNode = currentNode?.next
        current1 = current1?.next
        current2 = current2?.next
    }
    
    if carry > 0 {
        currentNode?.next = .init(val: carry)
    }
    
    return node.next
}

