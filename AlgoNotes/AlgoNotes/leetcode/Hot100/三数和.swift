//
//  三数和.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/3/20.
//

// https://leetcode-cn.com/problems/3sum/

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    
    let list = nums.sorted()
    
    var res: [[Int]] = []
    var i = 0
    
    while i < list.count {
        if list[i] > 0 {
            break
        }
        
        if i > 0 && list[i] == list[i - 1] {
            i += 1
            continue
        }
        
        var l = i + 1
        var r = list.count - 1
        
        while l < r {
            let sum = list[i] + list[l] + list[r]
            
            if sum == 0 {
                res.append([list[i], list[l], list[r]])
                
                repeat {
                    l += 1
                } while l < r && list[l] == list[l - 1]
                
                repeat {
                    r -= 1
                } while l < r && list[r] == list[r + 1]
            }
            else if sum < 0 {
                repeat {
                    l += 1
                } while l < r && list[l] == list[l - 1]
            }
            else if sum > 0 {
                repeat {
                    r -= 1
                } while l < r && list[r] == list[r + 1]
            }
        }
        
        i += 1
    }

    return res
}
