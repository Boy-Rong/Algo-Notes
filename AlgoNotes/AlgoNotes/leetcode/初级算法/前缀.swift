//
//  前缀.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/10.
//

import Foundation

// 例如，存在如下单词  ['google', 'gucci 官网', 'g18', 'g小调进行曲', 'great', 'girl', 'go', 'g2', 'gai', 'go的过去式英文', 'google play下载', 'go on', 'got', 'google翻译', 'go out', 'god', 'goal', 'good night', 'good morning', 'good luck!什么意思', 'goodafternoon怎么读英语', '百度', '国家']
// 输入 'good', 得到 ["good night", "good morning", "good luck!什么意思", "goodafternoon怎么读英语"]


func commonPrefix(_ list: [String], prefix: String) -> [String] {
    guard !list.isEmpty, !prefix.isEmpty else {
        return list
    }
    
    var array = list
    
    // 符合条件的索引，初始化假设没有
    var begin = 0
    let prefixCount = prefix.count
    
    for i in 0 ..< list.count {
        let string = array[i]
        if string.count < prefixCount {
            continue
        }
        
        // 截取 string 前 prefixCount 字符串
        let startIndex = string.startIndex
        let endIndex = string.index(string.startIndex, offsetBy: prefixCount)
        let strPrefix = String(string[startIndex ..< endIndex])
        
        if strPrefix == prefix {
            // 交换 i begin 元素位置
            (array[i], array[begin]) = (array[begin], array[i])
            begin += 1
        }
    }
    
    let value = array.prefix(begin)
    
    return Array(value)
}
