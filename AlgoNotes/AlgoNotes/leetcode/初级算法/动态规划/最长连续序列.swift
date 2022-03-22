//
//  最长连续序列.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/4.
//

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return nums.count
    }
    
    var array = nums
    _quickSort(&array)
    
    var dp: [Int] = [1, 1]
    var maxCount = Int.min
    for i in 1 ..< array.count {
        (dp[0], dp[1]) = (dp[1], dp[0])
        
        if abs(array[i] - array[i - 1]) == 1 {
            dp[1] = dp[0] + 1
        }
        else if array[i] == array[i - 1] {
            dp[1] = dp[0]
        }
        else {
            dp[1] = 1
        }
        
        maxCount = max(maxCount, dp[1])
    }
    
    return maxCount
}

func _quickSort(_ list: inout [Int]) {
    if list.count < 2 {
        return
    }
    _quickSort(&list, b: 0, e: list.count - 1)
}

func _quickSort(_ list: inout [Int], b: Int, e: Int) {
    guard b < e else {
        return
    }
    
    let index = _pointIndex(&list, b: b, e: e)
    _quickSort(&list, b: b, e: index - 1)
    _quickSort(&list, b: index + 1, e: e)
}

func _pointIndex(_ list: inout [Int], b: Int, e: Int) -> Int {
    guard b < e else {
        return b
    }
    
    var begin = b
    var end = e
    let index = Int.random(in: begin ... end)
    (list[begin], list[index]) = (list[index], list[begin])
    
    let value = list[begin]
    while begin < end {
        while begin < end {
            if value < list[end] {
                end -= 1
            }
            else {
                list[begin] = list[end]
                begin += 1
                break
            }
        }
        
        while begin < end {
            if value > list[begin] {
                begin += 1
            }
            else {
                list[end] = list[begin]
                end -= 1
                break
            }
        }
    }
    
    list[end] = value
    
    return end
}
