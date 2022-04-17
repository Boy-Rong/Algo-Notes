//
//  盛最多水的容器.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/22.
//

// https://leetcode-cn.com/problems/container-with-most-water/

import Foundation


func maxArea(_ height: [Int]) -> Int {
    if height.isEmpty {
        return 0
    }
    
    var maxS = 0
    var left = 0
    var right = height.count - 1
    
    while left < right {
        let s = (right - left) * min(height[left], height[right])
        maxS = max(maxS, s)
        
        if height[left] < height[right] {
            left += 1
        }
        else if height[left] > height[right] {
            right -= 1
        }
        else {
            left += 1
        }
    }
    
    return maxS
}
