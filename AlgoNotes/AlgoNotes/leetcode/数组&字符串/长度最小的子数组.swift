//
//  长度最小的子数组.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

import Foundation

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var index = 0
    var sum = 0
    var minCount = Int.max
    
    for i in 0 ..< nums.count {
        sum += nums[i]
        
        while sum >= target {
            minCount = min(minCount, i - index + 1)
            
            sum -= nums[index]
            index += 1
        }
    }
    
    return minCount == .max ? 0 : minCount
}
