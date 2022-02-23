//
//  路径总和.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/2/18.
//

// https://leetcode-cn.com/leetbook/read/data-structure-binary-tree/xo566j/
import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
        return true
    }
    
    let value = targetSum - (root?.val ?? 0)
    let has = hasPathSum(root?.left, value) || hasPathSum(root?.right, value)
    
    return root?.val == targetSum
}
