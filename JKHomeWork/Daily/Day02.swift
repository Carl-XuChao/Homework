//
//  Day02.swift
//  HomeWork
//
//  Created by GZ05008ML on 2021/12/29.
//

import Foundation

/*
 【Day02】 今日打卡题目来啦
 
 🌸反转链表-206
 https://leetcode-cn.com/problems/reverse-linked-list/
 
 */

class RevertLinkNode {
    
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
    
    ///方法一：  反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newLinkList: ListNode?
        let head = head
        var h = head
        while h != nil {
            let currentNode = ListNode(val: h?.val ?? 0, next: nil)
            currentNode.next = newLinkList
            newLinkList = currentNode
            h = h?.next
        }
        return newLinkList
    }
    
    
    
    /*
     nil->1->2->3->4->5->nil
     nil<-1 2->3->4->5->nil
     nil<-1<-2 3->4->5->nil
     nil<-1<-2<-3 4->5->nil
     nil<-1<-2<-3<-4 5->nil
     nil<-1<-2<-3<-4<-5 nil
     */
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var preNode: ListNode? = nil
        var curNode = head
        while (curNode != nil) {
            let nextNode = curNode?.next
            curNode?.next = preNode
            preNode = curNode
            curNode = nextNode
        }
        return preNode
    }
    
    
    
    func test() {
        let a = createList(arr: [1,2,3,4,5])
        foreachList(node: a!)
        print("----------------------")
        //        if let b = reverseList(a!) {
        //            foreachList(node: b)
        //        }
        if let b = reverseList1(a!) {
            foreachList(node: b)
        }
    }
    
}
