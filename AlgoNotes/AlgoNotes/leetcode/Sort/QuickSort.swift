//
//  QuickSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

// https://leetcode-cn.com/problems/sort-an-array/submissions/
/// 快速排序
public func quickSort<T: Comparable>(_ list: inout [T], begin: Int, end: Int) {
    guard end - begin > 1 else {
        return
    }
    
    let mid = point(&list, b: begin, e: end)
    quickSort(&list, begin: begin, end: mid)
    quickSort(&list, begin: mid + 1, end: end)
}

private func point<T: Comparable>(_ list: inout [T], b: Int, e: Int) -> Int {
    var begin = b
    // 快速排序end位置为最后一个索引
    var end = e - 1
    // 将begin位置的元素变成[begin+1, end]中的随机元素
    let randomIndex = begin + Int.random(in: 1 ... (end - begin))
    (list[begin], list[randomIndex]) = (list[randomIndex], list[begin])
    
    let beginValue = list[begin]

    // begin == end 时就找到了描点元素
    while begin < end {
        while begin < end {
            if list[end] > beginValue {
                end -= 1
            }
            else {
                list[begin] = list[end]
                begin += 1
                break
            }
        }
        
        while begin < end {
            if list[begin] < beginValue {
                begin += 1
            }
            else {
                list[end] = list[begin]
                end -= 1
                break
            }
        }
    }
    
    list[end] = beginValue
    return end
}
