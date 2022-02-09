//
//  字符串中的第一个唯一字符.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

func firstUniqChar(_ s: String) -> Int {
    guard !s.isEmpty else {
        return -1
    }
    guard s.count > 1 else {
        return 0
    }
    let list = Array(s)
    var map: [Character: Int] = [:]
    
    for value in list {
        if let number = map[value] {
            map[value] = number + 1
        }
        else {
            map[value] = 1
        }
    }
    
    for i in 0 ..< list.count {
        if map[list[i]] == 1 {
            return i
        }
    }
    
    return -1
}
