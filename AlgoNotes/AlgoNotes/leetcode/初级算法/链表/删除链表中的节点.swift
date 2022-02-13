//
//  删除链表中的节点.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnarn7/
import Foundation

func deleteNode(_ node: ListNode?) {
    guard let node = node, let next = node.next else {
        return
    }
    
    node.val = next.val
    node.next = next.next
}
