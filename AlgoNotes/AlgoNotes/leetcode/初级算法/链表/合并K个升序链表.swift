//
//  合并K个升序链表.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/2.
//

import Foundation

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 1 else {
        return lists.first ?? nil
    }
    
    var head = lists.first ?? nil
    let listCount = lists.count
    
    for i in 1 ..< listCount {
        head = mergeTwoLists(head, lists[i])
    }
    
    return head
    
    var isFor = true
        while isFor {
            guard let array = readLine()?
                    .split(separator: " ")
                    .map({ Int($0) ?? 0 }) else {
                continue
            }
            let value = array[0] + array[1]
            print(value)
        }
}


func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 1 else {
        return lists.first ?? nil
    }
    
    let mid = lists.count / 2
    let head = mergeKLists(Array(lists.prefix(mid)))
    let tail = mergeKLists(Array(lists.suffix(lists.count - mid)))
                           
    return mergeTwoLists(head, tail)
}
