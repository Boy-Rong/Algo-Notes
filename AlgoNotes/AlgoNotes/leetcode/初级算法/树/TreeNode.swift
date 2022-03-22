//
//  TreeNode.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/9.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int = 0, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: Hashable {
    
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs === rhs
    }
    
    var hashValue: Int {
        ObjectIdentifier(self).hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
    
}
