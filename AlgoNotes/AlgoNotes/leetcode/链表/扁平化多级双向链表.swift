//
//  File.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/25.
//

// https://leetcode-cn.com/leetbook/read/linked-list/fw8v5/
import Foundation

class TNode {
    var val: Int
    var prev: TNode?
    var next: TNode?
    var child: TNode?
    init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
   }
}

func flatten(_ head: TNode?) -> TNode? {
    var current = head
    
    var tail: TNode?
    var pre: TNode?
    var count = 0
    while current != nil {
        if current?.child != nil {
            tail = flatten(current?.child)
        }
        else if tail == nil {
            count += 1
        }
        
        pre = current
        current = current?.next
    }
    
    current = pre
    while count > 0 {
        current?.next = .init(0)
        pre = current
        current = current?.next
        count -= 1
    }
    
    pre?.next = tail
    
    return head
}
