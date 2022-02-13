//
//  Fizz Buzz .swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/12.
//

// https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xngt85/
import Foundation

func fizzBuzz(_ n: Int) -> [String] {
    guard n > 0 else {
        return []
    }
    
    var list: [String] = []
    
    for i in 1 ... n {
        var str = String(i)
        if i % 3 == 0 && i % 5 == 0 {
            str = "FizzBuzz"
        } else if i % 3 == 0 {
             str = "Fizz"
        } else if i % 5 == 0 {
            str = "Buzz"
        }
        list.append(str)
    }
    return list
}
