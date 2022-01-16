//
//  week03.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/16.
//

import Foundation
import SwiftUI

class WeekThree {
    
    var map: [Int : Int] = [:]
    var post: [Int] = []
    
    
}


///  合并K个升序链表
extension WeekThree {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        let res = dfs(lists, start: 0, end: lists.count - 1)
        return res
    }
    
    
    private func dfs(_ lists: [ListNode?], start: Int, end: Int) -> ListNode? {
        if start == end {
            return lists[start]
        }
        let mid = (start + (end - start)) / 2
        let leftList = dfs(lists, start: start, end: mid)
        let rightList = dfs(lists, start: mid + 1, end: end)
        let res = mergeTwoLinkLists(leftList, rightList)
        return res
    }
    
    private func mergeTwoLinkLists(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var l = left
        var r = right
        if l == nil {
            return r
        }
        if r == nil {
            return l
        }
        let dummy = ListNode()
        var tail: ListNode? = dummy
        while l != nil && r != nil  {
            if l!.val > r!.val {
                tail?.next = r
                r = r!.next
            } else {
                tail?.next = l
                l = l!.next
            }
            tail = tail?.next
        }
        if l != nil {
            tail?.next = l
        }
        if r != nil {
            tail?.next = r
        }
        return dummy.next
    }
    
}



/// 106. 从中序与后序遍历序列构造二叉树
extension WeekThree {
    
    

     func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for i in 0..<inorder.count {
            map[inorder[i]] = i
        }
        post = postorder
        let root = buildTree(midStart: 0, midEnd: inorder.count - 1, postStart: 0, postEnd: postorder.count - 1)
        return root
    }
    
    private func buildTree(midStart: Int, midEnd: Int, postStart: Int, postEnd: Int) -> TreeNode? {
        if midEnd < midStart || postEnd < postStart {
            return nil
        }
        let root = post[postEnd]
        let ri = map[root]!
    
        let node = TreeNode(root)
        node.left = buildTree(midStart: midStart, midEnd: ri - 1, postStart: postStart, postEnd: postStart + ri - midStart - 1)
        node.right = buildTree(midStart: ri + 1, midEnd: midEnd, postStart: postStart + ri - midStart, postEnd: postEnd - 1)
        return node
    }
    
    
    static func test() {
        let inorder = [9,3,15,20,7]
        let postorder = [9,15,7,20,3]
        let obj = WeekThree()
        let res = obj.buildTree(inorder, postorder)
    }
    
}
