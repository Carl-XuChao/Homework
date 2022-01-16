//
//  Day20.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/15.
//

import Foundation

/*
 【Day20】 今日打卡题目

 🌸二叉树的序列化与反序列化-297
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
*/


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: Int) {
            self.val = val
        }
    }
    
/* 层序遍历， 存储
 */
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        var quene: [TreeNode?] = [root]
        var res: [String] = []
        while quene.count > 0 {
            let node = quene.first!
            quene.removeFirst()
            if let val = node?.val, "\(val)" != "null" {
                res.append("\(val)")
                quene.append(node?.left)
                quene.append(node?.right)
            } else {
                res.append("null")
            }
        }
        return res.joined(separator: ",")
    }
    
    
    func deserialize(_ data: String) -> TreeNode? {
        if data == "null" {
            return nil
        }
        let list = data.split(separator: ",")
        if list.count == 0 {
            return nil
        }
        let root: TreeNode = TreeNode(Int(list[0])!)
        var quene: [TreeNode?] = [root]
        var index = 1
        while index < list.count {
            let curNode: TreeNode? = quene.first ?? nil
            quene.removeFirst()
            let leftVal = list[index]
            let rightVal = list[index + 1]
            if  String(leftVal) != "null" {
                let leftNode = TreeNode(Int(leftVal)!)
                curNode?.left = leftNode
                quene.append(leftNode)
            }
            if String(rightVal) != "null" {
                let rightNode = TreeNode(Int(rightVal)!)
                curNode?.right = rightNode
                quene.append(rightNode)
            }
            index += 2
        }
        return root
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
