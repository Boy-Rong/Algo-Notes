//
//  两数和.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/5.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int : Int] = [:]
    for i in 0 ..< nums.count {
        map[nums[i]] = i
    }
    
    for i in 0 ..< nums.count {
        if let index = map[target - nums[i]], i != index {
            return [i, index]
        }
    }
    
    return []
}
