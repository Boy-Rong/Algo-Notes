//
//  BubbleSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

/// 冒泡排序
public func bubbleSort1<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    
    var array = list
    var end = list.count
    
    while end > 1 {
        for i in 1 ..< end {
            if array[i - 1] > array[i] {
                (array[i - 1], array[i]) = (array[i], array[i - 1])
            }
        }
        
        end -= 1
    }
    
    return array
}

/// 冒泡排序优化
public func bubbleSort<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    
    var array = list
    var end = list.count
    
    while end > 1 {
        var lastExchange = 1
        
        for i in 1 ..< end {
            if array[i - 1] > array[i] {
                (array[i - 1], array[i]) = (array[i], array[i - 1])
                lastExchange = i
            }
        }
     
        end = lastExchange
    }
    
    return array
}
