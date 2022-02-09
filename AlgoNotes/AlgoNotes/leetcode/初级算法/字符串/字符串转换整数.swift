//
//  字符串转换整数.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

func myAtoi(_ s: String) -> Int {
    let string = s.trimmingCharacters(in: .whitespaces)
    guard !string.isEmpty else {
        return 0
    }
    
    guard
        let firstStr = string.first,
        ["-", "+"].contains(firstStr) || ("0"..."9").contains(firstStr)
    else {
        return 0
    }
    
    let isPuls = firstStr != "-"
    let stringList = Array(string)
    var list: [Int32] = []
    
    for i in 0 ..< stringList.count {
        if i == 0 && ["-", "+"].contains(stringList[i]) {
            continue
        }
        if let value = Int32(String(stringList[i])) {
            list.append(value)
        } else {
            break
        }
    }
    
    guard !list.isEmpty else {
        return 0
    }
    
    var nums: Int32 = 0
    for value in list {
        // 溢出
        if nums > Int32.max / 10 ||
            (nums == Int32.max / 10 && value > Int32.max % 10) {
            return isPuls ? Int(Int32.max) : Int(Int32.min)
        }
        
        nums = nums * 10 + value
    }
    
    if !isPuls {
        nums = 0 - nums
    }
    
    return Int(nums)
}
