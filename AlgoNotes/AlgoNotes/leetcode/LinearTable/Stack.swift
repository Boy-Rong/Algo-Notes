//
//  Stack.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/26.
//

import Foundation

public struct Stack<Element> {
    
    private var elements: [Element] = []
    
    public init() { }
    
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == Element {
        self.elements.append(contentsOf: elements)
    }
    
    /// 栈顶元素
    var top: Element? {
        elements.last
    }
    
    var count: Int {
        elements.count
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var isFull: Bool {
        count == elements.capacity
    }
    
    // 返回或者设置队列的存储空间
    public var capacity: Int {
        get {
            return elements.capacity
        }
        set {
            elements.reserveCapacity(newValue)
        }
    }
    
    
    /// 入栈
    public mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    /// 出栈
    public mutating func pop() -> Element {
        elements.removeLast()
    }
    
}
