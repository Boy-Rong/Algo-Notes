//
//  无重复字符的最长子串.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/6.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    
    let strArray = Array(s)
    var map: [String : Int] = [:]
    var start = 0
    var end = 0
    var maxValue = 0
    
    while end < strArray.count {
        let char = String(strArray[end])
        if map.keys.contains(char) {
            start = max(start, map[char] ?? 0)
        }
        
        maxValue = max(end - start + 1, maxValue)
        end += 1
        map[char] = end
    }

    return maxValue
}
