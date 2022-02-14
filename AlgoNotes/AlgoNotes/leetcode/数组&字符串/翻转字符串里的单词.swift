//
//  翻转字符串里的单词.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/14.
//

// https://leetcode-cn.com/leetbook/read/array-and-string/crmp5/
import Foundation

/*
func reverseWords(_ s: String) -> String {
    guard !s.isEmpty else {
        return ""
    }
    
    // 从后开始遍历
    for i in 0 ..< string.count - 1 {
        // 截取字符串用
        let currentIndex = string.index(string.startIndex, offsetBy: string.count - 1 - i)
        let nextIndex = string.index(before: currentIndex)
        let currentChar = string[currentIndex]
        let nextChar = string[nextIndex]
        
        // 单词结束
        if currentChar != " " && nextChar == " " {
            let subString = String(string[currentIndex ..< lastIndex])
            
            let suffixString = newString.isEmpty ? subString : " \(subString)"
            newString.append(suffixString)
            lastIndex = nextIndex
        }
        // 单词开始
        else if currentChar == " " && nextChar != " " {
            lastIndex = currentIndex
        }
    }
    
    return newString
}
*/
