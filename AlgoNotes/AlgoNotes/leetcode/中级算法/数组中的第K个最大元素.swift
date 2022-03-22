//
//  数组中的第K个最大元素.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/4.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count > 0 && k > 0 else {
        return 0
    }

    var array = nums
    let index = findK(&array, k: k)
    return array[index]
}

func findK(_ list: inout [Int], k: Int) -> Int {
    var begin = 0
    var end = list.count
    
    let target = list.count - k
    while begin < end {
        let index = pointIndex(&list, b: begin, e: end)
        if index > target {
            end = index
        }
        else if index < target {
            begin = index + 1
        }
        else {
            return index
        }
    }
    
    return end
}

private func pointIndex(_ list: inout [Int], b: Int, e: Int) -> Int {
    guard b < e else {
        return b
    }
    
    var begin = b
    var end = e - 1
    let index = Int.random(in: begin ... end)
    (list[index], list[begin]) = (list[begin], list[index])
    
    let value = list[begin]
    while begin < end {
        while begin < end {
            if value < list[end] {
                end -= 1
            } else {
                list[begin] = list[end]
                begin += 1
                break
            }
        }
        
        while begin < end {
            if value > list[begin] {
                begin += 1
            }
            else {
                list[end] = list[begin]
                end -= 1
                break
            }
        }
    }
 
    list[end] = value
    return end
}
