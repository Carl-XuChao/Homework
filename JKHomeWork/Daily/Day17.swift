//
//  Day17.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/13.
//

import Foundation

/*
 【Day17】 今日打卡题目

 🌸验证二叉搜索树-98
 https://leetcode-cn.com/problems/validate-binary-search-tree/
 */

class ValidBST {
    
    class TreeNode {
        
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    var pre = Int.min
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        guard let node = root else {
            return true
        }

        // 访问左子树
        if !isValidBST(node.left) {
            return false
        }
        // 访问当前节点：如果当前节点小于等于中序遍历的前一个节点，说明不满足BST，返回 false；否则继续遍历
        if node.val <= pre {
            return false
        }
        pre = node.val
        
        // 访问右子树
        return isValidBST(node.right)
    }
}
