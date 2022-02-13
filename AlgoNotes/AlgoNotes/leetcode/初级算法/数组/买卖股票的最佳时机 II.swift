//
//  买卖股票的最佳时机 II.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2zsx1/
import Foundation

func maxProfit2(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }
    
    var nums = 0
    for i in 1 ..< prices.count {
        // 升值
        if prices[i] > prices[i - 1] {
            nums += (prices[i] - prices[i - 1])
        }
    }

    return nums
}
