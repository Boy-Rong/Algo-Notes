//
//  回文链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnv1oc/
import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    guard head?.next != nil else {
        return false
    }
    
    var stack = Stack<ListNode>()
    
    var current = head
    while current != nil {
        stack.push(current!)
        current = current?.next
    }
    
    var i = 0
    let count = stack.count
    
    var headNode = head
    var tailNode: ListNode? = stack.pop()
    while (i < count / 2) || headNode === tailNode {
        if headNode?.val != tailNode?.val {
            return false
        }
        
        headNode = headNode?.next
        tailNode = stack.pop()
        i += 1
    }
    
    return true
}


func isPalindrome1(_ head: ListNode?) -> Bool {
    guard head?.next != nil else {
        return false
    }
    
    var fast = head
    var slow = head
    
    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    var current = head
    var tail = reverseList(slow)
    
    while tail != nil {
        if current?.val != tail?.val {
            return false
        }
        current = current?.next
        tail = tail?.next
    }
    
    return true
}

