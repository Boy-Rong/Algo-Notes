//
//  环形链表 II.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/19.
//

// https://leetcode-cn.com/leetbook/read/linked-list/jjhf6/
import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    repeat {
        slow = slow?.next
        fast = fast?.next?.next
    }
    while fast != nil && fast !== slow
    
    if fast == nil {
        return nil
    }
    
    fast = head
    
    while fast !== slow {
        fast = fast?.next
        slow = slow?.next
    }
    
    return fast
}

