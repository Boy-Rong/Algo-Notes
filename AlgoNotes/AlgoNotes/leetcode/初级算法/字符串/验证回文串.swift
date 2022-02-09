//
//  验证回文串.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else {
        return true
    }
    let string = s.lowercased().filter {
        ("a"..."z").contains($0) || ("0"..."9").contains($0)
    }
    let list = Array(string)
    
    var begin = 0
    var end = list.count - 1
    
    while begin < end {
        if list[begin] == list[end] {
            begin += 1
            end -= 1
        }
        else {
            return false
        }
    }
    
    return true
}
