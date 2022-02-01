//
//  SelectionSort.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/31.
//

import Foundation

public func selectionSort<T: Comparable>(_ list: [T]) -> [T] {
    guard list.count > 1 else {
        return list
    }
    
    var array = list
    var end = array.count
    
    while end > 1 {
        var maxIndex = 0
        for i in 1 ..< end {
            if array[maxIndex] <  array[i] {
                maxIndex = i
            }
        }
        
        (array[end - 1], array[maxIndex]) = (array[maxIndex], array[end - 1])
        
        end -= 1
    }
    
    return array
}
