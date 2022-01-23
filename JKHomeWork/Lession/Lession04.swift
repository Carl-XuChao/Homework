//
//  Lession04.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/23.
//

import Foundation
import SwiftUI



class Lession04 {

    // 二叉搜索树找后继点
    func inorderSuccessor(_ root: TreeNode, _ p: TreeNode) -> TreeNode {
        return getNext(root, p.val)
    }
    
    func getNext(_ root: TreeNode?, _ val: Int) -> TreeNode {
        var ans: TreeNode?
        var cur: TreeNode? = root
        // 检索到p这个点
        while cur != nil {
            // 找到之后
            if cur!.val == val {
                // 存在右子树， 递归左子树到叶子结点即可
                if cur?.right != nil {
                    ans = cur?.right
                    while ans?.left != nil {
                        ans = ans?.left
                    }
                }
                break
            }
            if val < cur!.val {
                // 找经过点里面最小的一个
                if ans == nil || ans!.val > cur!.val {
                    ans = cur
                }
                cur = cur?.left
            } else {
                cur = cur?.right
            }
            
        }
        return ans!
    }
    
    
    
    
}
