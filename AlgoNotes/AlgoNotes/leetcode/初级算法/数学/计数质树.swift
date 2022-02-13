//
//  计数质树.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnzlu6/
import Foundation

func countPrimes(_ n: Int) -> Int {
    guard n > 1 else {
        return 0
    }
    var list: [Bool] = .init(repeating: true, count: n)
    var count = 0
    for i in 2 ..< n {
        if !list[i] {
            continue
        }
        
        count += 1
        
        var j = 2 * i
        while j < n {
            list[j] = false
            j += i
        }
    }
    return count
}
