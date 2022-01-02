//
//  File.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/1.
//

import Foundation

/*
 【Day06】 新年快乐，坚持做题嗷🧨
 
 🌸K 个一组翻转链表-25
 https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
 
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 k 是一个正整数，它的值小于或等于链表的长度。
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 进阶：
 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 👉https://jinshuju.net/f/lLWx1u
 */

class ReverseKGroup {
    
    /*  k = 3
     nil->1->2->3->4->5->nil
     
     3->2->1->nil
     4->5->nil
     
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return head;
        }
        var tailNode = head
        for _ in 0..<k {
            if tailNode == nil { // 不足k个不需要反转
                return head
            }
            tailNode = tailNode?.next
        }
        // 分组反转
        let newHead = reverse(head: head, k: k)
        // 头结点反转之后移动到末尾， 指向下一个反转链表的头部进行连接
        head?.next = reverseKGroup(tailNode, k)
        return newHead
    }
    
    
    
    
    // 反转链表
    func reverse(head: ListNode?, k: Int) -> ListNode? {
        var n = 0
        var preNode: ListNode? = nil
        var curNode = head
        var nextNode: ListNode? = nil
        while (n < k) {
            nextNode = curNode?.next
            curNode?.next = preNode
            preNode = curNode
            curNode = nextNode
            n += 1
        }
        return preNode
    }
    
    
    
    // 创建链表  --- 头插法
    func createList(arr: [Int]) -> ListNode? {
        let link = ListNode()
        var head = link
        arr.forEach { item in
            let currentNode = ListNode(val: item, next: nil)
            head.next = currentNode
            head = currentNode
        }
        return link.next
    }
    
    ///  遍历链表打印
    func foreachList(node: ListNode) {
        var head = node
        while true {
            print("foreachList: \(head.val)")
            if let b = head.next {
                head = b
            } else {
                break
            }
        }
    }
    
    
    
    
    func test() {
        let a = createList(arr: [1,2,3,4,5])
        foreachList(node: a!)
        print("----------------------")
        if let b = reverseKGroup(a, 3) {
            foreachList(node: b)
        }
    }
    
    
}
