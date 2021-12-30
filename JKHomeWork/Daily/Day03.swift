//
//  Day03.swift
//  JKHomeWork
//
//  Created by GZ05008ML on 2021/12/30.
//

import Foundation

/*
 【Day03】 今日打卡题目来啦

 🌸环形链表-141
 https://leetcode-cn.com/problems/linked-list-cycle/

 做完题目后，你需要：
 1、将代码截图发到群里
 2、在刷题打卡登记表里登记，班班能核对到你们的打卡记录
 👉https://jinshuju.net/f/lLWx1u
 */

class HasCycle {
        
    func hasCycle(_ head: ListNode?) -> Bool {
        guard var head = head else {
            return false
        }
        var fastHead = head.next?.next
        while head.next != nil {
            if (head.next == nil || fastHead == nil) {
                return false
            }
            
            if (isEqual(head, fastHead!)) {
                return true
            }
                
            head = head.next!
            fastHead = fastHead?.next?.next
        }
        return false
    }
    
    
    func isEqual(_ a: ListNode, _ b: ListNode) -> Bool {
        return Unmanaged.passUnretained(a).toOpaque() == Unmanaged.passUnretained(b).toOpaque()
    }
            
}
