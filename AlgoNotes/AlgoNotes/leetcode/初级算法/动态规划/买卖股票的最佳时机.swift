//
//  买卖股票的最佳时机.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/11.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn8fsh/
import Foundation


func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var maxPrices = 0
    var dp: [[Int]] = .init(
        repeating: .init(repeating: 0, count: 2),
        count: prices.count
    )
    dp[0][0] = 0
    dp[0][1] = -prices[0]
    
    for i in 1 ..< prices.count {
        dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
        dp[i][1] = max(dp[i - 1][1], -prices[i])
        let maxValue = max(dp[i][0], dp[i][1])
        if maxValue > maxPrices {
            maxPrices = maxValue
        }
    }
    
    return maxPrices
}
