//
//  QuickSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

public class QuickSort<Element: Comparable> {
    
    private var list: [Element]
    
    init(sortList: [Element]) {
        list = sortList
    }
    
    public func sort() -> [Element] {
        sort(begin: 0, end: list.count)
        return list
    }
    
    private func sort(begin: Int, end: Int) {
        guard end - begin > 1 else {
            return
        }
        
        let mid = point(b: begin, e: end)
        sort(begin: begin, end: mid)
        sort(begin: mid + 1, end: end)
    }
    
    private func point(b: Int, e: Int) -> Int {
        var begin = b
        // 快速排序end位置为最后一个索引
        var end = e - 1
        // 将begin的位置变成随机元素
        let randomIndex = Int.random(in: (begin + 1) ... end)
        (list[begin], list[randomIndex]) = (list[randomIndex], list[begin])
        // beginValue 为序列中随机的而不是第一个
        let beginValue = list[begin]

        while begin != end {
            while begin != end {
                if list[end] < beginValue {
                    list[begin] = list[end]
                    begin += 1
                    break
                }
                else {
                    end -= 1
                }
            }
            
            while begin != end {
                if list[begin] > beginValue {
                    list[end] = list[begin]
                    end -= 1
                    break
                }
                else {
                    begin += 1
                }
            }
        }
        
        list[end] = beginValue
        return end
    }
    
}
