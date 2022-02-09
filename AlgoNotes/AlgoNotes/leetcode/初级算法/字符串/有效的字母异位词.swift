//
//  有效的字母异位词.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }

    let sList = s.sorted()
    let tList = t.sorted()
    let count = sList.count
    
    for i in 0 ..< count {
        if sList[i] != tList[i] {
            return false
        }
    }
    return true
}
