//
//  打乱数组.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

import Foundation

class Solution {
    let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return nums
    }
    
    func shuffle() -> [Int] {
        var list = nums
        
        for i in 0 ..< list.count {
            let index = Int.random(in: i ..< list.count)
            (list[i], list[index]) = (list[index], list[i])
        }
        
        return list
    }
}
