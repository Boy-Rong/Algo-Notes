//
//  合并两个有序链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/2.
//

//https://leetcode-cn.com/problems/merge-two-sorted-lists/

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let list = ListNode()
    var leftList = list1
    var rightList = list2
    
    var current: ListNode? = list
    
    while leftList != nil || rightList != nil {
        if
            let leftValue = leftList?.val,
            let rightValue = rightList?.val {
             if leftValue < rightValue {
                current?.next = leftList
                leftList = leftList?.next
            }
            else {
                current?.next = rightList
                rightList = rightList?.next
            }
        }
        else if leftList == nil {
            current?.next = rightList
            rightList = nil
        }
        else if rightList == nil {
            current?.next = leftList
            leftList = nil
        }

        current = current?.next
    }
    return list.next
}
