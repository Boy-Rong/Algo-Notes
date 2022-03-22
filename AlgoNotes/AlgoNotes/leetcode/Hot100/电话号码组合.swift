//
//  电话号码组合.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/20.
//

// https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    let phoneMap = [
        "2" : ["a", "b", "c"],
        "3" : ["d", "e", "f"],
        "4" : ["g", "h", "i"],
        "5" : ["j", "k", "l"],
        "6" : ["m", "n", "o"],
        "7" : ["p", "q", "r", "s"],
        "8" : ["t", "u", "v"],
        "9" : ["w", "x", "y", "z"]
    ]
    
    if digits.count < 2 {
        return phoneMap[digits] ?? []
    }
    
    let strList = Array(digits)
    var queue: Queue<String> = .init()
    
    for str in strList {
        guard let chartList = phoneMap[String(str)] else {
            continue
        }
        
        if queue.isEmpty {
            for char in chartList {
                queue.enqueue(element: char)
            }
            continue
        }
        
        var tmpList: [String] = []
        
        while !queue.isEmpty {
            if let top = queue.dequeue() {
                for char in chartList {
                    let value = "\(top)\(char)"
                    tmpList.append(value)
                }
            }
        }
        
        for value in tmpList {
            queue.enqueue(element: value)
        }
    }
    
    return queue.values
}
