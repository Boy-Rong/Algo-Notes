//
//  Queue.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/24.
//

import Foundation

// 定义一个队列结构
public struct Queue<Element> {
    
    private var elements: [Element] = []
    
    public init() {}
    
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == Element {
        self.elements.append(contentsOf: elements)
    }
    
    public var count: Int {
        elements.count
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    /// 队头元素
    public var top: Element? {
        elements.first
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
    
    /// 入队
    public mutating func enqueue(element: Element) {
        elements.append(element)
    }
    
    /// 出队
    public mutating func dequeue() -> Element? {
        return elements.removeFirst()
    }
    
    public mutating func clear() {
        elements.removeAll()
    }
    
}
