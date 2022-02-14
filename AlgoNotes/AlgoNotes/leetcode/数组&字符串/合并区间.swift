//
//  合并区间.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/13.
//

import Foundation

func merge(_ intervals: inout [[Int]]) -> [[Int]] {
    guard intervals.count > 0 else {
        return [[]]
    }
    
    // 先对区间排序
    intervals.sort { old, current in old[0] < current[0] }
    
    var index = 0
    for i in 1 ..< intervals.count {
         // mergae
        if (intervals[i][0] >= intervals[index][0] &&
            intervals[i][0] <= intervals[index][1]) {
            let min = min(intervals[index][0], intervals[i][0])
            let max = max(intervals[index][1], intervals[i][1])
            intervals[index] = [min, max]
        }
        else {
            index += 1
            intervals[index] = intervals[i]
        }
    }

    return Array(intervals.prefix(index + 1))
}
