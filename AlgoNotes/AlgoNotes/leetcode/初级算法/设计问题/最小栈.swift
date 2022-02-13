//
//  最小栈.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnkq37/

import Foundation

class MinStack {

    private var list: [Int] = []
    private var minList: [Int] = [.max]
        
    init() {
        
    }
    
    func push(_ val: Int) {
        list.append(val)
        
        if val <= minList.last ?? .max {
            minList.append(val)
        }
    }
    
    func pop() {
        let value = list.removeLast()
        if value == minList.last ?? .max {
            minList.removeLast()
        }
    }
    
    func top() -> Int {
        list.last ?? 0
    }
    
    func getMin() -> Int {
        minList.last ?? .min
    }
}

