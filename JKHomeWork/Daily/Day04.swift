//
//  Day04.swift
//  JKHomeWork
//
//  Created by GZ05008ML on 2021/12/30.
//

import Foundation

/*
 【Day04】 今日打卡题目来啦

 🌸环形链表 II-142
 https://leetcode-cn.com/problems/linked-list-cycle-ii/

 做完题目后，你需要：
 1、将代码截图发到群里
 2、在刷题打卡登记表里登记，班班能核对到你们的打卡记录
 👉https://jinshuju.net/f/lLWx1u
 */



func detectCycle(_ head: ListNode?) -> ListNode? {
    var numList: [UnsafeMutableRawPointer] = []
    var node = head
    while node != nil {
        if numList.contains(Unmanaged.passUnretained(node!).toOpaque()) {
            return node
        }
        numList.append(Unmanaged.passUnretained(node!).toOpaque())
        node = node?.next
    }
    return nil;
}



// 
