//
//  File.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/15.
//

import Foundation

public class NTreeNode {
     public var value: Int
     public var children: [NTreeNode] = []
     
    public init(_ value: Int, children: [NTreeNode]) {
         self.value = value
         self.children = children
     }
 }

public func search(root: NTreeNode, targetId: Int) -> [Int] {
  let list = search(root, targetId: targetId)
  return Array(list)
}

public func search(_ root: NTreeNode, targetId: Int) -> [Int] {
   if root.children.isEmpty && root.value == targetId {
     return [root.value]
   } else if root.children.isEmpty && root.value != targetId {
     return []
   }

   var list: [Int] = []
   for node in root.children {
     let subList = search(node, targetId: targetId)
     if !subList.isEmpty {
         list.append(root.value)
         list.append(contentsOf: subList)
     }
   }

   return list
}
