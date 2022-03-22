//
//  反转每对括号间的子串.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/7.
//

// https://leetcode-cn.com/problems/reverse-substrings-between-each-pair-of-parentheses/
import Foundation

func reverseParentheses(_ s: String) -> String {
    if s.isEmpty {
        return ""
    }
    
    var strStack: Stack<String> = .init()
    let strList = Array(s)
    
    var string = ""
    
    for char in strList {
        if char == "(" {
            strStack.push(string)
            string = ""
        }
        else if char == ")" {
            let top = strStack.pop()
            let reversed = String(string.reversed())
            string = "\(top)\(reversed)"
        }
        else {
            string = "\(string)\(char)"
        }
    }
    
    return string
}
