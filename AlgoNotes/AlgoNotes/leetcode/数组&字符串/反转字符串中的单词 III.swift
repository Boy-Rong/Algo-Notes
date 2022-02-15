//
//  反转字符串中的单词 III.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/15.
//

import Foundation

func reverseWords(_ s: String) -> String {
    guard s.count > 0 else {
        return ""
    }
    
    let charList = Array(s)
    var newString = ""
    
    var start = 0
    var end = 0
    
    while end < charList.count {
        while end < charList.count && charList[end] != " "{
            end += 1
        }
        
        var currentEnd = end
        while currentEnd > start {
            currentEnd -= 1
            newString.append(charList[currentEnd])
        }
        
        while end < charList.count && charList[end] == " " {
            end += 1
        }
        
        if end < charList.count {
            newString += " "
            start = end
        }
    }
    
    return newString
}
