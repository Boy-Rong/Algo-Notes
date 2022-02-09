//
//  实现 strStr().swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/6.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty || haystack == needle {
        return 0
    }
    guard haystack.count >= needle.count else {
        return -1
    }
    
    let needleCount = needle.count
    
    var i = 0
    while i + needleCount - 1 < haystack.count {
        let index = haystack.index(haystack.startIndex, offsetBy: i)
        let end = haystack.index(haystack.startIndex, offsetBy: i + needleCount)
        let subStr = String(haystack[index ..< end])
        
        if subStr == needle {
            return i
        }
        
        i += 1
    }
    
    return -1
}
