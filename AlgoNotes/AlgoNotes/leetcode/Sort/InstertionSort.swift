//
//  InstertionSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

public func instertionSort1<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    
    var array = list
    var beSortedIndex = 1
    
    while beSortedIndex < array.count {
        var i = beSortedIndex
        while i > 0 {
            guard array[i] < array[i - 1] else {
                // 碰到比自己小的直接结束循环
                break
            }
            (array[i], array[i - 1]) = (array[i - 1], array[i])
            i -= 1
        }
        
        beSortedIndex += 1
    }
    return array
}


public func instertionSort2<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    
    var array = list
    var beSortedIndex = 1
    
    while beSortedIndex < array.count {
        var i = beSortedIndex
        let beSortedValue = array[i]
        while i > 0 {
            guard beSortedValue < array[i - 1] else {
                break
            }
            array[i] = array[i - 1]
            i -= 1
        }
        
        array[i] = beSortedValue
        
        beSortedIndex += 1
    }
    return array
}


public func instertionSort<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    var array = list
    var beSortedIndex = 1
    
    while beSortedIndex < array.count {
        let beSortedValue = list[beSortedIndex]
        let index = intertionIndex(value: beSortedValue, list: Array(array.prefix(beSortedIndex)))
        
        var i = beSortedIndex
        
        while i > index {
            array[i] = array[i - 1]
            i -= 1
        }
        array[index] = beSortedValue
        
        beSortedIndex += 1
    }
    
    return array
}

public func intertionIndex<T: Comparable>(value: T, list: [T]) -> Int {
    guard !list.isEmpty else {
        return 0
    }
    
    var begin = 0
    var end = list.count
    
    while begin != end {
        let mid = (begin + end) / 2
        if value < list[mid] {
            end = mid
        }
        else {
            begin = mid + 1
        }
    }
    
    return end
}


public func dicingSearch<T: Comparable>(_ value: T, list: [T]) -> Int? {
    guard !list.isEmpty else {
        return nil
    }
    
    var begin = 0
    var end = list.count
    
    while begin < end {
        let mid = Int((begin + end) / 2)
        
        if value < list[mid] {
            end = mid
        }
        else if value > list[mid] {
            begin = mid + 1
        }
        else {
            return mid
        }
    }
    
    return nil
}
