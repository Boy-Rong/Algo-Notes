//
//  最大子序和.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn3cg3/
import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    
    var dp: [Int] = .init(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var maxValue = dp[0]
    for i in 1 ..< nums.count {
        if dp[i - 1] > 0 {
            dp[i] = dp[i - 1] + nums[i]
        }
        else {
            dp[i] = nums[i]
        }
        dp[i] = max(dp[i - 1], 0) + nums[i]
        
        maxValue = max(dp[i], maxValue)
    }
    return maxValue
}
