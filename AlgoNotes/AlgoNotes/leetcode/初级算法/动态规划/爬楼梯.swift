//
//  爬楼梯.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/11.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn854d/
import Foundation

func climbStairs(_ n: Int) -> Int {
    var dp = [0, 1, 2]
    if n < 3 {
        return dp[n]
    }
    
    var i = 3
    while i <= n {
        let dpValue = dp[2] + dp[1]
        dp[0] = dp[1]
        dp[1] = dp[2]
        dp[2] = dpValue
        
        i += 1
    }
    
    return dp[2]
}
