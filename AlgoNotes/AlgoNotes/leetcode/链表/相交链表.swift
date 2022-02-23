//
//  相交链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/19.
//

// https://leetcode-cn.com/leetbook/read/linked-list/jjbj2/
import Foundation

func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var tailA = revertedList(headA)
    var tailB = revertedList(headB)
    
    while tailA === tailB {
        tailA = tailA?.next
        tailB = tailB?.next
    }
    
    return tailA
}

func revertedList(_ node: ListNode?) -> ListNode? {
    var current = node
    var tempNode: ListNode?
    
    while current != nil {
        let next = current?.next
        current?.next = tempNode
        tempNode = current
        current = next
    }
    
    return tempNode
}

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var currentA = headA
    var currentB = headB
    
    while currentA !== currentB {
        currentA = currentA?.next
        currentB = currentB?.next
        
        if currentA == nil && currentB == nil {
            return nil
        }
        
        if  currentA == nil {
            currentA = headB
        }
        
        if currentB == nil {
            currentB = headA
        }
        
    }
    
    return currentA
}
