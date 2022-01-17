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
        var array: [ListNode] = []
        for item in lists {
            if let a = item {
                array.append(a)
            }
        }
        if array.count == 0 {
            return nil
        }
        let res = dfs(array, start: 0, end: array.count - 1)
        return res
    }
    
    
    private func dfs(_ lists: [ListNode?], start: Int, end: Int) -> ListNode? {
        if start == end {
            return lists[start]
        }
        let mid = (start + (end - start)) / 2
        let leftList = dfs(lists, start: start, end: mid)
        let rightList = dfs(lists, start: mid + 1, end: end)
        return mergeTwoLists(leftList, rightList)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l = l1
        var r = l2
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
    
    
    static func createList(arr: [Int]) -> ListNode? {
        let link = ListNode()
        var head = link
        arr.forEach { item in
            let currentNode = ListNode(val: item, next: nil)
            head.next = currentNode
            head = currentNode
        }
        return link.next
    }
    
    
    static func testMergeKLists() {
        let array = [[],[-1,5,11],[],[6,10]]
        var data: [ListNode?] = []
        for item in array {
            let b = WeekThree.createList(arr: item)
            data.append(b)
        }
        
        let obj = WeekThree()
        obj.mergeKLists(data)
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
