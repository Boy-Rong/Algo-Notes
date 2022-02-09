//
//  整数反转.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnx13t/
import Foundation

// 益出 有问题
func reverse(_ x: Int) -> Int {
    guard x != 0 else {
        return 0
    }
    
    let isBurden = x < 0
    let numberString = String(abs(x))
    var stringList = Array(numberString)
    reverseString(&stringList)
    
    let number = stringList.reduce("", { String($0) + String($1) })
    guard var value = Int(number), value < (2 << 31) else {
        return 0
    }
    if isBurden {
        value = 0 - value
    }
    
    return value
}
