//
//  两数之和 II - 输入有序数组.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

// https://leetcode-cn.com/leetbook/read/array-and-string/cnkjg/

import Foundation

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else {
        return []
    }
    
    var left = 0
    var right = numbers.count - 1
    
    while left < right {        
        if target - numbers[right] > numbers[left] {
            left += 1
        }
        else if target - numbers[right] < numbers[left] {
            right -= 1
        }
        else {
            break
        }
    }

    return [left + 1, right + 1]
}
