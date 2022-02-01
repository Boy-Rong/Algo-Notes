//
//  MergeSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

public class MergeSort<Element: Comparable> {
    
    private var list: [Element]
    private var leftList: [Element?]
    
    init(sortList: [Element]) {
        list = sortList
        leftList = .init(repeating: nil, count: sortList.count / 2)
    }
    
    public func sort() -> [Element] {
        sort(begin: 0, end: list.count)
        return list
    }
    
    private func sort(begin: Int, end: Int) {
        guard end - begin > 1 else {
            return
        }
        
        let mid = (begin + end) / 2
        sort(begin: begin, end: mid)
        sort(begin: mid, end: end)
        merge(begin: begin, mid: mid, end: end)
    }
    
    private func merge(begin: Int, mid: Int, end: Int) {
        var li = 0
        let le = mid - begin
        var ri = mid
        let re = end
        // 数组当前已排序的索引
        var ai = begin
        
        // copy list左半部分
        for i in 0 ..< (mid - begin) {
            leftList[i] = list[begin + i]
        }
        
        // 将left right两部分有序数组合并成一个数组
        while li < le { // left排完了代表 数组已经合并完毕
            // 右边数组已经排完，直接将左边数组元素copy
            if ri == re {
                list[ai] = leftList[li]!
                li += 1
            }
            else {
                if leftList[li]! < list[ri] {
                    list[ai] = leftList[li]!
                    li += 1
                }
                else {
                    list[ai] = list[ri]
                    ri += 1
                }
            }
            
            ai += 1
        }
    }
    
}
